import 'package:json_annotation/json_annotation.dart';
import 'package:prisma_dart/src/generator/ast/dmmf/dmmf.dart' as dmmf_file;
import 'package:prisma_dart/src/generator/ast/transform/index.dart';

part "model.g.dart";

@JsonSerializable()
class Model {
  final String name;
  final List<Field> fields;
  final List<Index> indexes;
  Model(this.name, this.fields, this.indexes);

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);

  static List<Model> models(dmmf_file.Document dmmf) {
    return dmmf.datamodel.models.map((e) {
      final fields = e.fields.map((e) => Field(e, false)).toList();
      return Model(e.name, fields, Index.indexes(e));
    }).toList();
  }
}

@JsonSerializable()
class Field {
  final bool prisma;
  @JsonKey(fromJson: dmmfFieldFromJson, toJson: dmmfFieldToJson)
  final dmmf_file.Field field;
  Field(
    this.field,
    this.prisma,
  );

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
  Map<String, dynamic> toJson() => _$FieldToJson(this);
}

dmmf_file.Field dmmfFieldFromJson(Map<String, dynamic> json) =>
    dmmf_file.Field.fromJson(json);
Map<String, dynamic> dmmfFieldToJson(dmmf_file.Field field) => field.toJson();
// Field fromJson(Map<String, dynamic> json) => Field(
//       dmmf_file.Field.fromJson(json['field'] as Map<String, dynamic>),
//       json['prisma'] as bool,
//     );

// Map<String, dynamic> toJson(Field instance) => <String, dynamic>{
//       'prisma': instance.prisma,
//       'field': instance.field.toJson(),
//     };