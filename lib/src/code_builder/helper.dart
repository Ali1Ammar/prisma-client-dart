



import 'package:code_builder/code_builder.dart';

Iterable<Parameter> fieldsToRequiredParameters(Iterable<Field> fields)=>fields.map((e) => Parameter((p) {
            p.name = e.name;
            p.toThis = true;
          }));