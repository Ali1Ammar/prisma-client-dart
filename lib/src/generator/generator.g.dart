// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Root _$RootFromJson(Map<String, dynamic> json) => Root(
      Generator.fromJson(json['generator'] as Map<String, dynamic>),
      (json['otherGenerators'] as List<dynamic>)
          .map((e) => Generator.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['schemaPath'] as String,
      Document.fromJson(json['DMMF'] as Map<String, dynamic>),
      (json['datasources'] as List<dynamic>)
          .map((e) => Datasource.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['datamodel'] as String,
      BinaryPaths.fromJson(json['binaryPaths'] as Map<String, dynamic>),
      json['ast'],
    );

Map<String, dynamic> _$RootToJson(Root instance) => <String, dynamic>{
      'generator': instance.generator,
      'otherGenerators': instance.otherGenerators,
      'schemaPath': instance.schemaPath,
      'DMMF': instance.DMMF,
      'datasources': instance.datasources,
      'datamodel': instance.datamodel,
      'binaryPaths': instance.binaryPaths,
      'ast': instance.ast,
    };

Generator _$GeneratorFromJson(Map<String, dynamic> json) => Generator(
      json['output'],
      json['name'] as String,
      json['provider'],
      (json['binaryTargets'] as List<dynamic>)
          .map((e) => BinaryTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['pinnedBinaryTarget'],
    );

Map<String, dynamic> _$GeneratorToJson(Generator instance) => <String, dynamic>{
      'output': instance.output,
      'name': instance.name,
      'provider': instance.provider,
      'binaryTargets': instance.binaryTargets,
      'pinnedBinaryTarget': instance.pinnedBinaryTarget,
    };

BinaryTarget _$BinaryTargetFromJson(Map<String, dynamic> json) => BinaryTarget(
      json['fromEnvVar'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$BinaryTargetToJson(BinaryTarget instance) =>
    <String, dynamic>{
      'fromEnvVar': instance.fromEnvVar,
      'value': instance.value,
    };

Value _$ValueFromJson(Map<String, dynamic> json) => Value(
      json['fromEnvVar'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$ValueToJson(Value instance) => <String, dynamic>{
      'fromEnvVar': instance.fromEnvVar,
      'value': instance.value,
    };

EnvValue _$EnvValueFromJson(Map<String, dynamic> json) => EnvValue(
      json['fromEnvVar'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$EnvValueToJson(EnvValue instance) => <String, dynamic>{
      'fromEnvVar': instance.fromEnvVar,
      'value': instance.value,
    };

Datasource _$DatasourceFromJson(Map<String, dynamic> json) => Datasource(
      json['name'] as String,
      $enumDecode(_$ConnectorTypeEnumMap, json['connectorType']),
      EnvValue.fromJson(json['url'] as Map<String, dynamic>),
      json['config'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$DatasourceToJson(Datasource instance) =>
    <String, dynamic>{
      'name': instance.name,
      'connectorType': _$ConnectorTypeEnumMap[instance.connectorType]!,
      'url': instance.url,
      'config': instance.config,
    };

const _$ConnectorTypeEnumMap = {
  ConnectorType.mysql: 'mysql',
  ConnectorType.mongo: 'mongo',
  ConnectorType.sqlite: 'sqlite',
  ConnectorType.postgresql: 'postgresql',
};

BinaryPaths _$BinaryPathsFromJson(Map<String, dynamic> json) => BinaryPaths(
      Map<String, String>.from(json['migrationEngine'] as Map),
      Map<String, String>.from(json['queryEngine'] as Map),
      Map<String, String>.from(json['introspectionEngine'] as Map),
    );

Map<String, dynamic> _$BinaryPathsToJson(BinaryPaths instance) =>
    <String, dynamic>{
      'migrationEngine': instance.migrationEngine,
      'queryEngine': instance.queryEngine,
      'introspectionEngine': instance.introspectionEngine,
    };
