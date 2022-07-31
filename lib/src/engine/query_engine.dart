
import 'package:http/http.dart';

class QueryEngine {
  final Client client;
  // TODO need http client , cmd client
  final String url;
  final String schema;
  final bool hasBinaryTargets;
  final bool disconnected;

  QueryEngine( this.client,this.url, this.schema, this.hasBinaryTargets, this.disconnected);
  
  String get name=>"query-engine";
}