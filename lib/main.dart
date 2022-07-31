import 'dart:convert';
import 'dart:io';

import 'package:prisma_dart/src/generator/generator.dart';
import 'package:prisma_dart/src/jsonRpc/jsonrpc.dart';
import 'package:prisma_dart/src/jsonRpc/manifest.dart';
import 'package:prisma_dart/transform.dart';

void main(List<String> args) {
 try {
    while (true) {
    final contentString = stdin.readLineSync()!;
    final content =
        Request.fromJson(jsonDecode(contentString) as Map<String, dynamic>);
    String? response;
    switch (content.method) {
      case Method.getManifest:
        final res = Response.newResponse(
            content.id,
            ManifestResponse(
                manifest: Manifest(
                    prettyName: "Prisma Client Dart",
                    defaultOutput: "lib/generated")));
        response = jsonEncode( res.toJson());
        break;

      case Method.generate:
        response = null; // success
        final Root prisma = Root.fromJson(content.params);
        transform(prisma); // add ast to Root
        break;
    }
    print(response);
    stderr.writeln(response);
  }
 } catch (e,s) {
   print(e);
   print(s);
 }
}
