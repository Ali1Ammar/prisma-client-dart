
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

  static List<Model> models(dmmf_file.Document dmmf){
    return dmmf.datamodel.models.map((e) {
      final fields = e.fields.map((e) => Field(e,false)).toList() ;
      return Model(e.name, fields, Index.indexes(e));
    }).toList();
  }
}


@JsonSerializable()
class Field {
  final bool prisma;

  final dmmf_file.Field field; 
  Field( this.field,this.prisma,);

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
  Map<String, dynamic> toJson() => _$FieldToJson(this);
}