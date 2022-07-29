import 'dart:convert';
import 'dart:io';

import 'package:prisma_dart/src/jsonRpc/jsonrpc.dart';
import 'package:prisma_dart/src/jsonRpc/manifest.dart';

void main(List<String> args) {
  while (true) {
    final contentString = stdin.readLineSync()!;
    print(contentString);

    final content =
        Request.fromJson(jsonDecode(contentString) as Map<String, dynamic>);
    switch (content.method) {
      case Method.getManifest:
        final res = Response.newResponse(
            content.id,
            ManifestResponse(
                manifest: Manifest(
                    prettyName: "Prisma Client Dart",
                    defaultOutput: "lib/generated")));
        stderr.writeln(res.toJson());
        break;
      case Method.generate:
        break;
    }
  }
}
