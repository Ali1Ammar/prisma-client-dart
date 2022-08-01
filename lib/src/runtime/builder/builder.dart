import 'dart:convert';

import 'package:prisma_dart/src/engine/engine.dart';

class Input {
  final String name;
  final List<Field> fields;
  final Object value;
  final bool wrapList;

  Input(this.name, this.value, [this.fields=const[],this.wrapList=false]);//TODO const list
}

class Output {
  final String name;
  final List<Input>? input;
  final List<Output> output;

  Output(this.name, this.input, this.output);
}

class Field {
  final String name;
  final bool list;
  final bool wrapList;
  final Map<String, dynamic>? value;
  final List<Field>? fields;

  Field(this.name, this.list, this.wrapList, this.value, this.fields);
}

class Query {
  final Engine engine;
  final String operation;
  final String? name;
  final String method;
  final String? model;
  final List<Input> input;
  List<Output> output=[];
  late DateTime startTime;

  late Map<String, dynamic> txResult;//TODO this was written as chan in golang

  Query({required this.engine,required this.operation,this.name,required this.method, this.model,
     required this.input,});

  String build() {
    return """
$operation $name {
  result: ${buildInner()}
}
""";
  }

  String buildInner() {
    // final builder = StringBuffer();
    // builder.write("$method$model");
    // if (input.isNotEmpty) {
    //   builder.write(buildInputs());
    // }
    // builder.write(" ");

    // if (output.isNotEmpty) {
    //   builder.write(buildOutputs());
    // }
    // return builder.toString();
    return """
$method$model
${buildInputs(input)}
${buildOutputs(output)}
""";
  }

  String buildInputs(List<Input> input) {
    final builder = StringBuffer("(");
    for (var val in input) {
      builder.write(val.name);
      builder.write(":");
      if (val.value != null) {
        builder.write(jsonEncode(val.value));
      } else {
        if (val.wrapList) {
          builder.write("[");
          builder.write(buildFields(
              val.wrapList, val.wrapList, val.fields)); //TODO two wraplist
          builder.write("]");
        }
      }
      builder.write(",");
    }
    builder.write(")");
    return builder.toString();
  }

  String buildOutputs(List<Output> output) {
    final builder = StringBuffer("{");
    for (var val in output) {
      builder.write(val.name);
      builder.write(" ");
      if (val.input?.isNotEmpty ?? false) {
        builder.write(buildInputs(val.input!));
      }
      if (val.output.isNotEmpty) {
        builder.write(buildOutputs(val.output));
      }
    }
    builder.write("}");
    return builder.toString();
  }

  String buildFields(bool list, bool wrapList, List<Field> fields) {
    final builder = StringBuffer();
    if (!list) builder.write("{");

    final finals = <Field>[];
    final uniqueNames = <String>[];

    final uniques = <String, Field>{};

    for (var i = 0; i < fields.length; i++) {
      final field = fields[i];
      if (uniques.containsKey(field.name)) {
        const noField = ["AND", "OR", "NOT"];
        if (field.fields != null &&
            noField.every((element) => element != field.name)) {
          uniques[field.name]!.fields!.addAll(field.fields!);
        } else {
          finals.add(field);
        }
      } else {
        uniques[field.name] = field;
        uniqueNames.add(field.name);
      }
    }

    for (var name in uniqueNames) {
      finals.add(uniques[name]!);
    }

    for (var f in finals) {
      if (wrapList) {
        builder.write("{");
      }
      if (f.name.isNotEmpty) {
        builder.write(f.name);
        builder.write(":");
      }
      if (f.list) {
        builder.write("[");
      }
      if (f.fields != null) {
        builder.write(buildFields(f.list, f.wrapList, f.fields!));
      }
      if (f.value != null) {
        builder.write(jsonEncode(f.value));
      }

      if (f.list) {
        builder.write("]");
      }
      if (wrapList) {
        builder.write("}");
      }
      builder.write(",");
    }

    if (!list) {
      builder.write("}");
    }
    return builder.toString();
  }
  
}
