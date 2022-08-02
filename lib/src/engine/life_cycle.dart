import 'dart:convert';
import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:path/path.dart';
import 'package:prisma_dart/helper/cahce_dir.dart';
import 'package:prisma_dart/helper/command.dart';
import 'package:prisma_dart/src/binaries/binaries.dart';
import 'package:prisma_dart/src/binaries/platform/platform.dart';
import 'package:prisma_dart/src/engine/port.dart';
import 'package:prisma_dart/src/engine/protocol.dart';
import 'package:prisma_dart/src/engine/query_engine.dart';
import 'package:prisma_dart/src/engine/request.dart';

//TODO logger
Future<void> connect(QueryEngine engine) async {
  final file = ensure(engine);
  await spawn(engine, file);
}

Future<void> disconnect(QueryEngine engine) async {
  engine.disconnected = true;
  await engine.cmd.kill();
}

ensure(QueryEngine engine) {
  final binariesPath = globalUnpackDir(engineVersion);
  final os = Platform.operatingSystem;
  final binaryName = checkForExtension(os, os);
  final exactBinaryName = checkForExtension(os, binaryPlatformName());
  var forceVersion = true;
  String? file;
  var name = "prisma-query-engine-";
  final localPath = join("./", name + binaryName);
  final localExactPath = join("./", name + exactBinaryName);
  final globalPath = join(binariesPath, name + binaryName);
  final globalExactPath = join(binariesPath, name + exactBinaryName);

  final prismaQueryEngineBinary = getEnv("PRISMA_QUERY_ENGINE_BINARY");
  print("""
binariesPath $binariesPath
os $os
name $name
exactBinaryName $exactBinaryName
prismaQueryEngineBinary $prismaQueryEngineBinary
globalExactPath $globalExactPath
globalPath $globalPath
localExactPath $localExactPath
localPath $localPath
binaryName $binaryName

""");

  if (prismaQueryEngineBinary.isNotEmpty) {
    print("PRISMA_QUERY_ENGINE_BINARY is defined, using");

    if (File(prismaQueryEngineBinary).existsSync()) {
      throw "PRISMA_QUERY_ENGINE_BINARY was provided, but no query engine was found at ";
    }
    file = prismaQueryEngineBinary;
    forceVersion = false;
  }

  if (File(localExactPath).existsSync()) {
    print("exact query engine found in working directory");
    file = localExactPath;
  } else if (File(localPath).existsSync()) {
    print("query engine found in working directory");
    file = localPath;
  }
  if (File(globalExactPath).existsSync()) {
    print("exact query engine found in global path");
    file = globalExactPath;
  } else if (File(globalPath).existsSync()) {
    print("query engine found in global path");
    file = globalPath;
  }
  if (file == null) {
    throw "no binary found";
  }

  var out = Process.runSync(file, ["--version"]).stdout as String;
  out = out.replaceFirst("query-engine", "").trim();
  if (engineVersion != out) {
    final note =
        "Did you forget to run `go run github.com/prisma/prisma-client-go generate`?";
    if (forceVersion) {
      throw "expected query engine version $engineVersion, but got $out ${engineVersion == out}. $note";
    }
    print("$note, ignoring since custom query engine was provided");
  }
  print("using query engine at ");
  print("ensure query engine took ");
  return file;
}

Future<void> spawn(QueryEngine engine, String file) async {
  final port = await getPort();
  final url = "http://localhost:$port";
  final dotEnv = DotEnv()..load();
  final cmd = Command(
      file,
      ["-p", port.toString(), "--enable-raw-queries"],
      stdout,
      stderr,
      {
        // ignore: invalid_use_of_visible_for_testing_member
        ...dotEnv.map, //TODO find a better place to load dotEnv
        ...Platform.environment,
        "PRISMA_DML": engine.schema,
        // "RUST_LOG": "error",//TODO re enable it after disable below TODO
        "RUST_LOG_FORMAT": "json",
        "PRISMA_CLIENT_ENGINE_TYPE": "binary",
        "PRISMA_LOG":
            "QUERIES=y", //TODO only for logging and debugging disable it
        "RUST_LOG":
            "info", //TODO only for logging and debugging disable it  , and enable the above TODO
      });
  await cmd.start();
  Object? connectErr;
  StackTrace? stack;
  List<GQLError>? gqlErrors;
  engine.cmd = cmd;
  engine.url = url;
  for (var i = 0; i < 100; i++) {
    try {
      final body = await request(engine, "GET", "/status", {});
      final decodeBody = json.decode(body) as Map<String, dynamic>;
      try {
        if (decodeBody.containsKey("status") && decodeBody['status'] == "ok") {
          connectErr = null;
          gqlErrors = null;
          break;
        }
        final res = GQLResponse.fromJson(decodeBody);
        if (res.errors.isNotEmpty) {
          gqlErrors = res.errors;
          sleep(Duration(milliseconds: 50));
          continue;
        }
        connectErr = null;
        gqlErrors = null;
        break;
      } catch (e, s) {
        connectErr = e;
        stack = s;
        sleep(Duration(milliseconds: 50));
        continue;
      }
    } catch (e, s) {
      connectErr = e;
      stack = s;
      sleep(Duration(milliseconds: 100));
      continue;
    }
  }
  if (connectErr != null) {
    throw Exception(
      "readiness query error connectErr: $connectErr \n $stack",
    );
  }
  if (gqlErrors != null) {
    throw Exception("readiness query error gqlErrors : $gqlErrors");
  }
}
