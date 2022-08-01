import 'dart:convert';

import 'package:prisma_dart/src/engine/do.dart';
import 'package:prisma_dart/src/engine/protocol.dart';
import 'package:prisma_dart/src/engine/query_engine.dart';
import 'package:prisma_dart/src/runtime/types/error.dart';
import 'package:prisma_dart/src/runtime/types/types.dart';

const internalUpdateNotFoundMessage =
    "Error occurred during query execution: InterpretationError(\"Error for binding '0'\", Some(QueryGraphBuilderError(RecordNotFound(\"Record to update not found.\"))))";
const internalDeleteNotFoundMessage =
    "Error occurred during query execution: InterpretationError(\"Error for binding '0'\", Some(QueryGraphBuilderError(RecordNotFound(\"Record to delete does not exist.\"))))";

Future<JsonMap> execute(
  QueryEngine engine,
  JsonMap payload,
) async {
  final startReq = DateTime.now();
  final body = await request(engine, "POST", "/", payload);
  final parseReq = DateTime.now();
  final GQLResponse response = GQLResponse.fromJson(json.decode(body));
  if (response.errors.isNotEmpty) {
    final first = response.errors.first;
    if (first.rawMessage() == internalUpdateNotFoundMessage ||
        first.rawMessage() == internalDeleteNotFoundMessage) {
      throw ErrNotFound();
    }
    throw Exception("pgl error: ${first.rawMessage()}");
  }
  return json.decode(body);
  //TODO recheck this
}

Future<JsonMap> batch(QueryEngine engine, JsonMap payload) async {
  final body = await request(engine, "POST", "/", payload);
  return json.decode(body);
}

Future<String> request(
    QueryEngine engine, String method, String path, JsonMap payload) async {
  if (engine.disconnected) {
    throw Exception("Engine is disconnected"); //TODO better error
  }
  final requestBody = jsonEncode(payload);
  return await requestHttp(
      engine.client, method, "${engine.url}$path", requestBody, (req) {
    req.headers["content-type"] = "application/json";
  });
}
