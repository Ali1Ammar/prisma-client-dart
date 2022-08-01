import 'package:prisma_dart/src/engine/engine.dart';
import 'package:prisma_dart/src/engine/protocol.dart';
import 'package:prisma_dart/src/runtime/builder/builder.dart';

// @JsonSerializable()
class TX {
  final Engine engine;
  TX(this.engine);

  Exec transaction(List<Param> queries) {
    final requests = queries
        .map((query) => GQLRequest(query.extractQuery().build(), {}))
        .toList();
    return Exec(queries, engine, requests);
  }
}

// @JsonSerializable()
abstract class Param {
  bool isTX();
  Query extractQuery();
  // Param();

  // factory Param.fromJson(Map<String, dynamic> json) => _$ParamFromJson(json);
  // Map<String, dynamic> toJson() => _$ParamToJson(this);
}

class Exec {
  final List<Param> queries;
  final Engine engine;
  final List<GQLRequest> requests;

  Exec(this.queries, this.engine, this.requests);
  Future<void> exec() async {
    //TODO this code was using channel but we removed
    GQLBatchRequest payload = GQLBatchRequest(requests, true);
    final result =
        GQLBatchResponse.fromJson(await engine.batch(payload.toJson()));
    if (result.errors.isNotEmpty) {
      throw result.errors.first;
    }
    for (var i = 0; i < result.batchResult.length; i++) {
      final inner = result.batchResult[i];
      if (inner.errors.isNotEmpty) {
        throw inner.errors.first;
      }

      queries[i].extractQuery().txResult =
          inner.data.result; //TODO this was written in golang use <- operator

    }
  }
}
