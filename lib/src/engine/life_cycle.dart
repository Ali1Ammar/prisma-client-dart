import 'dart:convert';
import 'dart:io';

import 'package:prisma_dart/helper/command.dart';
import 'package:prisma_dart/src/engine/port.dart';
import 'package:prisma_dart/src/engine/protocol.dart';
import 'package:prisma_dart/src/engine/query_engine.dart';
import 'package:prisma_dart/src/engine/request.dart';

void connect(QueryEngine engine) {
  final file = ensure(engine);
  spawn(engine, file);
}

void disconnect(QueryEngine engine) {
  engine.disconnected = true;
  //TODO
}

ensure(QueryEngine engine){
  //TODO
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
