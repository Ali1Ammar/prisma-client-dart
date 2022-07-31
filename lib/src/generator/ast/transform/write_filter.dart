import 'package:prisma_dart/src/generator/ast/transform/ast.dart';
import 'package:prisma_dart/src/generator/ast/transform/filters.dart';
import 'package:prisma_dart/src/generator/types.dart';

List<Filter> writeFilters(AST ast) {
  List<Filter> filters = [];

  for (var scalar in ast.scalars) {
    final p = ast.pick([
      "${scalar}FieldUpdateOperationsInput",
      "Nullable${scalar}FieldUpdateOperationsInput"
    ]);
    if (p == null) continue;
    List<Method> fields = [];
    for (var field in p.fields) {
      if (field.name == "set") continue;

      String typeName = ""; //TODO
      bool isList = false;

      for (final inputType in field.inputTypes??[]) {
        if (inputType.location == "scalar" && inputType.type != "Null") {
          typeName = inputType.type;
          if (inputType.isList) {
            isList = true;
          }
        }
      }

      fields.add(Method(field.name.dartCase, field.name, isList, "", typeName));
    }
    filters.add(Filter(scalar, fields));
  }

  // pick out extra methods, e.g. for list write operations
  // this could all be removed if the DMMF would implement operations by scalar, e.g. similar to
  // StringFilter there could be a write operation of StringListWriteOperations instead of individual
  // dmmf for each model+field combination
  for (var model in ast.models) {
    for (var field in model.fields) {
      final p = ast.pick([
        "${model.name}Update${field.field.name}Input",
      ]);
      if (p == null) continue;
      String scalarName = ""; //TODO empty
      List<Method> fields = [];
      for (var field in p.fields) {
        // specifically ignore equals, as it gets special handling
        if (field.name == "set") {
          for (var inputType in field.inputTypes??[]) {
            if (inputType.location == "scalar" && inputType.type != "Null") {
              scalarName =
                  "${inputType.type}List"; // create an on-the-fly <scalar>List filter type
            }
          }
          continue;
        }

        String typeName = ""; //TODO
        bool isList = false;

        for (final inputType in field.inputTypes??[]) {
          //TODO this a duplicited code convert to function
          if (inputType.location == "scalar" && inputType.type != "Null") {
            typeName = inputType.type;
            if (inputType.isList) {
              isList = true;
            }
          }
        }

        fields.add(Method(field.name.dartCase, field.name, isList, "", typeName));
      }
      filters.add(Filter(scalarName, fields));
    }
  }
  return filters;
}

Filter? writeFilter(AST ast, String scalar, bool isList) {
  if (isList) {
    scalar += "List";
  }
  for (final filter in ast.writeFilters) {
    if (filter.name == scalar) {
      return filter;
    }
  }
  return null;
}