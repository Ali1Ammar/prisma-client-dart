
import 'package:http/http.dart';
import 'package:prisma_dart/helper/command.dart';

class QueryEngine {
  final Client client;
  final Command cmd;
  // TODO need http client , cmd client
  String url;
  final String schema;
  final bool hasBinaryTargets;
  bool disconnected;

  QueryEngine( this.client,this.cmd,this.url, this.schema, this.hasBinaryTargets, this.disconnected);
  
  String get name=>"query-engine";
}