import 'package:prisma_dart/src/generator/ast/transform/ast.dart';
import 'package:prisma_dart/src/generator/ast/transform/filters.dart';
import 'package:prisma_dart/src/generator/ast/transform/model.dart';
import 'package:prisma_dart/src/generator/ast/dmmf/dmmf.dart' as dmmf_file;
import 'package:prisma_dart/src/generator/types.dart';

const list = "List";

List<Filter> readFilters(AST ast) {
  List<Filter> filters = [];
  for (final scalar in ast.scalars) {
    final combinations = [
      [
        "${scalar}ListFilter",
        "${scalar}NullableListFilter",
      ],
      [
        "${scalar}Filter",
        "${scalar}NullableFilter",
      ],
    ];

    for (final c in combinations) {
      final p = ast.pick(c);
      if (p == null) {
        continue;
      }
      final List<Method> fields = [];
      for (final field in p.fields) {
        final method = convertField(field);
        if (method != null) {
          fields.add(method);
        }
      }

      var s = scalar;
      if (p.name.contains("ListFilter")) {
        s += list;
      }

      filters.add(Filter(s, fields));
    }
  }

  for (final enumz in ast.enums) {
    final p = ast
        .pick(["Enum${enumz.name}Filter", "Enum${enumz.name}NullableFilter"]);

    if (p == null) {
      continue;
    }

    final List<Method> fields = [];
    for (final field in p.fields) {
      final method = convertField(field);
      if (method != null) {
        fields.add(method);
      }
    }
    filters.add(Filter(enumz.name, fields));
  }

  for (var i = 0; i < ast.models.length; i++) {
    final model = ast.models[i];
    final p = ast.pick(["${model.name}OrderByRelevanceInput"]);
    if (p == null) {
      continue;
    }

    final List<Method> methods = [];

    for (final field in p.fields) {
      final method = convertField(field);
      if (method != null) {
        methods.add(method);
      }
    }

    filters.add(Filter(p.name, methods));

    ast.models[i].fields.add(Field(
        dmmf_file.Field(
              kind: dmmf_file.FieldKind.scalar,
              name: "relevance",
              type:  p.name.dartCase,

    ),false));
  }

  return filters;
}

Filter? readFilter(AST ast, String scalar, bool isList) {
  scalar =
      scalar.replaceFirst("NullableFilter", "").replaceFirst("ReadFilter", "");
  if (isList) {
    scalar += list;
  }
  for (final filter in ast.readFilters) {
    if (filter.name == scalar) {
      return filter;
    }
  }
  return null;
}

Method? convertField(dmmf_file.OuterInputType field) {
  // specifically ignore equals, as it gets special handling
  if (field.name == "equals") {
    return null;
  }

  String typeName = ""; //TODO
  bool isList = false;
  for (final inputType in field.inputTypes??[]) {
    if ((inputType.location == "scalar" || inputType.location == "enumTypes") &&
        inputType.type != "Null") {
      typeName = inputType.type;
      if (inputType.isList) {
        isList = true;
      }
    }
  }
  
  return Method(
    field.name.dartCase ,
    field.name,
    isList,
    "",
    typeName,
  );
}





//TODO deprecatedReadFilters :145
