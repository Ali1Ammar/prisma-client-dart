import 'package:prisma_dart/src/runtime/builder/builder.dart';
import 'package:prisma_dart/src/runtime/raw/raw.dart';
import 'package:prisma_dart/src/runtime/types/types.dart';

class ExecuteExec {
  final Query query;

  ExecuteExec(this.query);

  factory ExecuteExec.executeRaw(Raw r, String query, List<Map> params) {
    return ExecuteExec(raw(r.engine, "executeRaw", query, params));
  }

  Query extractQuery() => query;

  BatchResult exec() {
    final count = query.exec() as int;
    return BatchResult(count);
  }

  TxExecuteResult tx() {
    return TxExecuteResult(query, {});
  }
}

class TxExecuteResult {
  final Query query;
  final Map result;

  TxExecuteResult(this.query, this.result);
  Query extractQuery() => query;
  BatchResult getResult() {//TODO rechek
    final count = query.txResult as int;
    return BatchResult(count);
  }
}
