

import 'package:json_annotation/json_annotation.dart';
import 'package:prisma_dart/src/generator/ast/dmmf/dmmf.dart';

part "enum.g.dart";

@JsonSerializable()
class Enumz {
final String name;
final List<String> values;
  Enumz(this.name, this.values);

  factory Enumz.fromJson(Map<String, dynamic> json) => _$EnumzFromJson(json);
  Map<String, dynamic> toJson() => _$EnumzToJson(this);

  static List<Enumz> enums(Document dmmf){
    return dmmf.schema.enumTypes.model.map((e) => Enumz(e.name, e.values)).toList();
  }
}

