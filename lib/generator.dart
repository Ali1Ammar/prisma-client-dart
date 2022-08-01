import 'dart:convert';
import 'dart:io';

import 'package:prisma_dart/src/generator/generator.dart';
import 'package:prisma_dart/src/generator/run.dart';
import 'package:prisma_dart/src/jsonRpc/jsonrpc.dart';
import 'package:prisma_dart/src/jsonRpc/manifest.dart';
import 'package:prisma_dart/transform.dart';

void invokePrisma() {
  print("invokingprisma running");

  try {
    while (true) {
      final contentString = stdin.readLineSync();
      if (contentString == null) return;
      final content =
          Request.fromJson(jsonDecode(contentString) as Map<String, dynamic>);
      Map<String, dynamic>? response;
      switch (content.method) {
        case Method.getManifest:
          print("getManifest");

          response = ManifestResponse(
                  manifest: Manifest(
                      prettyName: "Prisma Client Dart",
                      defaultOutput: "prisma/generated"))
              .toJson();
          break;

        case Method.generate:
          print("generatiiiing");
          response = null; // success
          final Root prisma = Root.fromJson(content.params);
          transform(prisma); // add ast to Root
          runGenerator(prisma);
          break;
      }
      print("response $response");
      stderr.writeln(
          jsonEncode(Response.newResponse(content.id, response).toJson()));
    }
  } catch (e, s) {
    print(e);
    print(s);
  }
}
