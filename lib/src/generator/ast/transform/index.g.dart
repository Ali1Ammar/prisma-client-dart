// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Index _$IndexFromJson(Map<String, dynamic> json) => Index(
      json['name'] as String,
      (json['fields'] as List<dynamic>).map((e) => e as String).toList(),
      json['internalName'] as String,
    );

Map<String, dynamic> _$IndexToJson(Index instance) => <String, dynamic>{
      'name': instance.name,
      'fields': instance.fields,
      'internalName': instance.internalName,
    };
