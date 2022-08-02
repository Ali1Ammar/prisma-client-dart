import 'package:http/http.dart';
import 'package:prisma_dart/src/engine/query_engine.dart';
import 'package:prisma_dart/src/runtime/lifecycle/lifecycle.dart';
import 'package:prisma_dart/src/runtime/raw/raw.dart';
import 'package:prisma_dart/src/runtime/transaction/transaction.dart';
import '../engine/query_engine_linuxs_gen.dart';
import 'datamodel.dart';

class PrismaClient {
  PrismaClient.newClient(this.engine, this.action);

  factory PrismaClient() {
    init();
    final engine = QueryEngine(Client(), datamodel, false);
    return PrismaClient.newClient(
        engine, PrismaActions(Lifecycle(engine), Raw(engine), TX(engine)));
  }

  final QueryEngine engine;

  final PrismaActions action;
}

class PrismaActions {
  PrismaActions(this.lifecycle, this.raw, this.tx);

  final Lifecycle lifecycle;

  final Raw raw;

  final TX tx;
}
