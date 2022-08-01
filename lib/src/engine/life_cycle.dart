import 'dart:convert';
import 'dart:io';

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
void connect(QueryEngine engine) {
  final file = ensure(engine);
  spawn(engine, file);
}

void disconnect(QueryEngine engine) {
  engine.disconnected = true;
  engine.cmd.kill();
}

String ensure(QueryEngine engine) {
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
  out = out.trim().replaceFirst("query-engine", "");
  if (engineVersion != out) {
    final note =
        "Did you forget to run `go run github.com/prisma/prisma-client-go generate`?";
    if (forceVersion) {
      throw "expected query engine version $engineVersion, but got $out. $note";
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
  final cmd = Command(
      file,
      ["--port", port.toString(), "--enable-raw-queries"],
      stdout,
      stderr,
      {
        ...Platform.environment,
        "PRISMA_DML": engine.schema,
        "RUST_LOG": "error",
        "RUST_LOG_FORMAT": "json",
        "PRISMA_CLIENT_ENGINE_TYPE": "binary",
      });
  await cmd.start();
  Object? connectErr;
  List<GQLError>? gqlErrors;
  for (var i = 0; i < 100; i++) {
    try {
      final body = await request(engine, "GET", "/status", {});

      try {
        final res = GQLResponse.fromJson(json.decode(body));
        if (res.errors.isNotEmpty) {
          gqlErrors = res.errors;
          sleep(Duration(milliseconds: 50));
          continue;
        }
        break;
      } catch (e) {
        connectErr = e;
        sleep(Duration(milliseconds: 50));
        continue;
      }
    } catch (e) {
      connectErr = e;
      sleep(Duration(milliseconds: 100));
      continue;
    }
  }
  if (connectErr != null) {
    throw Exception("readiness query error: $connectErr");
  }
  if (gqlErrors != null) {
    throw Exception("readiness query error: $gqlErrors");
  }
}
