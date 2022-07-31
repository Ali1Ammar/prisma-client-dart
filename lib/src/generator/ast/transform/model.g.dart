// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      json['name'] as String,
      (json['fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['indexes'] as List<dynamic>)
          .map((e) => Index.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'name': instance.name,
      'fields': instance.fields.map((e) => e.toJson()).toList(),
      'indexes': instance.indexes.map((e) => e.toJson()).toList(),
    };

Field _$FieldFromJson(Map<String, dynamic> json) => Field(
      dmmfFieldFromJson(json['field'] as Map<String, dynamic>),
      json['prisma'] as bool,
    );

Map<String, dynamic> _$FieldToJson(Field instance) => <String, dynamic>{
      'prisma': instance.prisma,
      'field': dmmfFieldToJson(instance.field),
    };
