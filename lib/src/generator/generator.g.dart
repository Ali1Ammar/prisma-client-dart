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
      Document.fromJson(json['dmmf'] as Map<String, dynamic>),
      (json['datasources'] as List<dynamic>)
          .map((e) => Datasource.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['datamodel'] as String,
      json['binaryPaths'] == null
          ? null
          : BinaryPaths.fromJson(json['binaryPaths'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RootToJson(Root instance) => <String, dynamic>{
      'generator': instance.generator.toJson(),
      'otherGenerators':
          instance.otherGenerators.map((e) => e.toJson()).toList(),
      'schemaPath': instance.schemaPath,
      'dmmf': instance.dmmf.toJson(),
      'datasources': instance.datasources.map((e) => e.toJson()).toList(),
      'datamodel': instance.datamodel,
      'binaryPaths': instance.binaryPaths?.toJson(),
    };

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      json['engineType'] as String?,
      json['disableGitignore'] as String?,
      json['disableGoBinaries'] as String?,
      json['package'] as String? ?? 'db',
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'engineType': instance.engineType,
      'package': instance.package,
      'disableGitignore': instance.disableGitignore,
      'disableGoBinaries': instance.disableGoBinaries,
    };

Generator _$GeneratorFromJson(Map<String, dynamic> json) => Generator(
      Value.fromJson(json['output'] as Map<String, dynamic>),
      json['name'] as String,
      Value.fromJson(json['provider'] as Map<String, dynamic>),
      (json['binaryTargets'] as List<dynamic>)
          .map((e) => BinaryTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['pinnedBinaryTarget'] as String?,
      Config.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeneratorToJson(Generator instance) => <String, dynamic>{
      'output': instance.output.toJson(),
      'name': instance.name,
      'provider': instance.provider.toJson(),
      'config': instance.config.toJson(),
      'binaryTargets': instance.binaryTargets.map((e) => e.toJson()).toList(),
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
      json['fromEnvVar'] as String?,
      json['value'] as String,
    );

Map<String, dynamic> _$ValueToJson(Value instance) => <String, dynamic>{
      'fromEnvVar': instance.fromEnvVar,
      'value': instance.value,
    };

EnvValue _$EnvValueFromJson(Map<String, dynamic> json) => EnvValue(
      json['fromEnvVar'] as String,
      json['value'] as String?,
    );

Map<String, dynamic> _$EnvValueToJson(EnvValue instance) => <String, dynamic>{
      'fromEnvVar': instance.fromEnvVar,
      'value': instance.value,
    };

Datasource _$DatasourceFromJson(Map<String, dynamic> json) => Datasource(
      json['name'] as String,
      toConnectorType(json['connectorType'] as String?),
      EnvValue.fromJson(json['url'] as Map<String, dynamic>),
      json['config'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$DatasourceToJson(Datasource instance) =>
    <String, dynamic>{
      'name': instance.name,
      'connectorType': fromConnectorType(instance.connectorType),
      'url': instance.url.toJson(),
      'config': instance.config,
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
