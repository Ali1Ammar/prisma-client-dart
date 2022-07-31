import 'package:json_annotation/json_annotation.dart';
import 'package:prisma_dart/src/generator/ast/dmmf/dmmf.dart';
import 'package:prisma_dart/src/generator/ast/transform/enum.dart' as enumz;
import 'package:prisma_dart/src/generator/ast/transform/model.dart' as model;
import 'package:prisma_dart/src/generator/ast/transform/order.dart';
import 'package:prisma_dart/src/generator/ast/transform/read_filter.dart'
    as read;
import 'package:prisma_dart/src/generator/ast/transform/write_filter.dart'
    as write;

import 'filters.dart';

part "ast.g.dart";

@JsonSerializable(
  createFactory: false
)
class AST {
  @JsonKey(ignore: true)
  Document dmmf;

  late List<String> scalars;

  late List<enumz.Enumz> enums = enumz.Enumz.enums(dmmf);

  late List<model.Model> models = model.Model.models(dmmf);

  late List<Filter> readFilters = read.readFilters(this);

  late List<Filter> writeFilters = write.writeFilters(this);

  late List<OrderBy> orderBys = [];
  AST(this.dmmf);

  // factory AST.fromJson(Map<String, dynamic> json) => _$ASTFromJson(json);
  Map<String, dynamic> toJson() => _$ASTToJson(this);

  CoreType? pick(List<String> names) {
    for (final name in names) {
      for (final i in dmmf.schema.inputObjectTypes.prisma) {
        if (i.name == name) {
          return i;
        }
      }
    }
    return null;
  }
}
