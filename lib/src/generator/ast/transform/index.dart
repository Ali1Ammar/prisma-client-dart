import 'package:json_annotation/json_annotation.dart';
import 'package:prisma_dart/src/generator/ast/dmmf/dmmf.dart';
import 'package:prisma_dart/src/generator/types.dart';

part "index.g.dart";

@JsonSerializable()
class Index {
  final String name;
  final List<String> fields;
  final String internalName;
  Index(this.name, this.fields, this.internalName);

  factory Index.fromJson(Map<String, dynamic> json) => _$IndexFromJson(json);
  Map<String, dynamic> toJson() => _$IndexToJson(this);

  static List<Index> indexes(Model model) {
    final indexs = model.uniqueIndexes.map((e) {
      final internalName =
          e.name.isNotEmpty ? e.name : _concatFieldsToName(e.fields);
      return Index(_getName(e.name, e.fields), e.fields, internalName);
    });
    if (model.primaryKey?.fields.isNotEmpty ?? false) {
      return indexs.followedBy([
        Index(
            _getName(_concatFieldsToName(model.primaryKey!.fields),
                model.primaryKey!.fields),
            model.primaryKey!.fields,
            _concatFieldsToName(model.primaryKey!.fields))
      ]).toList();
    }
    return indexs.toList();
  }
}

String _concatFieldsToName(List<String> fields) {
  return fields.join('_');
}

String _getName(String? field, List<String> fields) {
  if (field != null) return field;
  
  return fields.map((e) => e.dartCase).join();
  //TODO index.go :58
}
