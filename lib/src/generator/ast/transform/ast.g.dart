// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ASTToJson(AST instance) => <String, dynamic>{
      'scalars': instance.scalars,
      'enums': instance.enums.map((e) => e.toJson()).toList(),
      'models': instance.models.map((e) => e.toJson()).toList(),
      'readFilters': instance.readFilters.map((e) => e.toJson()).toList(),
      'writeFilters': instance.writeFilters.map((e) => e.toJson()).toList(),
      'orderBys': instance.orderBys.map((e) => e.toJson()).toList(),
    };
