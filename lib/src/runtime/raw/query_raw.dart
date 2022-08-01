import 'package:prisma_dart/src/runtime/builder/builder.dart';
import 'package:prisma_dart/src/runtime/raw/raw.dart';

class QueryExec {
  final Query query;

  QueryExec(this.query);

  factory QueryExec.queryRaw(Raw r, String query, List<Object> params) {
    return QueryExec(raw(r.engine, "queryRaw", query, params));
  }

  Query extractQuery() {
    //TODO: remove this maybe
    return query;
  }

  TxQueryResult tx() {
    return TxQueryResult(
      query,{}
    );
  }

  Object exec() {
    return query.exec();
  }
}

class QueryResult {
  final Map<String, dynamic> queryRaw;

  QueryResult(this.queryRaw);
}

class TxQueryResult {
  final Query query;
  final Map<String, dynamic> result;

  TxQueryResult(this.query, this.result);

  Object getResult() => query.txResult; //TODO recheck this

}
