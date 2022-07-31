// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Method _$MethodFromJson(Map<String, dynamic> json) => Method(
      json['name'] as String,
      json['action'] as String,
      json['isList'] as bool,
      json['deprecated'] as String,
      json['type'] as String,
    );

Map<String, dynamic> _$MethodToJson(Method instance) => <String, dynamic>{
      'name': instance.name,
      'action': instance.action,
      'isList': instance.isList,
      'deprecated': instance.deprecated,
      'type': instance.type,
    };

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
      json['name'] as String,
      (json['methods'] as List<dynamic>)
          .map((e) => Method.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'name': instance.name,
      'methods': instance.methods.map((e) => e.toJson()).toList(),
    };
