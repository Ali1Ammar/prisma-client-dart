import 'dart:convert';

import 'package:prisma_dart/src/engine/engine.dart';
import 'package:prisma_dart/src/runtime/builder/builder.dart';

class Raw {
  final Engine engine;

  Raw(this.engine);
}

Query raw(Engine engine, String action, String query, List<Object> params) {
  var input2 = [
    Input(
      "query",
      query,
    )
  ];
  StringBuffer buffer = StringBuffer("[");
  for (var i = 0; i < params.length; i++) {
    final param = params[i];
    if (i > 0) {
      buffer.write(",");
    }
    final data = jsonEncode(param);
    if (param is DateTime) {
      buffer.write('"{prisma__type":"date","prisma__value":$data}');
    } else {
      buffer.write(data);
    }
  }
  buffer.write("]");
  input2.add(Input(
    "parameters",
    buffer.toString(),
  ));
  return Query(
    engine: engine,
    operation: "mutation",
    method: action,
    input: input2,
  );
}
