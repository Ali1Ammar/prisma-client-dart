// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Enumz _$EnumzFromJson(Map<String, dynamic> json) => Enumz(
      json['name'] as String,
      (json['values'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$EnumzToJson(Enumz instance) => <String, dynamic>{
      'name': instance.name,
      'values': instance.values,
    };
