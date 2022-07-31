import 'package:json_annotation/json_annotation.dart';
import 'package:prisma_dart/src/jsonRpc/manifest.dart';

part "jsonrpc.g.dart";

@JsonSerializable()
class Request {
  final String jsonrpc;
  final int id;
  final Method method;
  final Map<String, dynamic> params;
  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  Request(this.jsonrpc, this.id, this.method, this.params);
  Map<String, dynamic> toJson() => _$RequestToJson(this);
}

@JsonSerializable()
class Response {
  final int id;
  final String jsonrpc;
  final ManifestResponse result;

  Response(this.id, this.jsonrpc, this.result);

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);

  factory Response.newResponse(int id, ManifestResponse result) {
    return Response(
      id,
      "2.0",
      result,
    );
  }
}

// Map<String, dynamic> responseResultToJson(dynamic result) {
//   print(result.toJson());
//   return result.toJson();
// }

enum Method { getManifest, generate }
