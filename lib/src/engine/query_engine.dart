
import 'package:http/http.dart';
import 'package:prisma_dart/helper/command.dart';
import 'package:prisma_dart/src/engine/engine.dart';
import 'package:prisma_dart/src/engine/life_cycle.dart' as lifecycle;
import 'package:prisma_dart/src/engine/request.dart' as req;
import 'package:prisma_dart/src/runtime/types/types.dart';

class QueryEngine extends Engine {
  final Client client;
  late Command cmd;
  late String url;
  final String schema;
  final bool hasBinaryTargets;
  bool disconnected=false;

  QueryEngine(this.client, this.schema,
      this.hasBinaryTargets);

  @override
  String get name => "query-engine";
  
  @override
  Future<Map<String, dynamic>> batch(Map<String, dynamic> payload)=>req.batch(this, payload);
  
  @override
  Future<void> connect()=>lifecycle.connect(this);
  
  @override
  Future<void> disconnect()=>lifecycle.disconnect(this);
  
  @override
  Future<JsonMap> execute(JsonMap payload)=>req.execute(this, payload);


}

const internalUpdateNotFoundMessage =
    "Error occurred during query execution: InterpretationError(\"Error for binding '0'\", Some(QueryGraphBuilderError(RecordNotFound(\"Record to update not found.\"))))";
const internalDeleteNotFoundMessage =
    "Error occurred during query execution: InterpretationError(\"Error for binding '0'\", Some(QueryGraphBuilderError(RecordNotFound(\"Record to delete does not exist.\"))))";
