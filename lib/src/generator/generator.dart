import 'package:json_annotation/json_annotation.dart';
import 'package:prisma_dart/src/generator/ast/dmmf/dmmf.dart';

part "generator.g.dart";

@JsonSerializable()
class Root {
  final Generator generator;
  final List<Generator> otherGenerators;
  final String schemaPath;
  final Document DMMF;
  final List<Datasource> datasources;
  final String datamodel;
  final BinaryPaths binaryPaths;
  final AST ast;
  Root(this.generator, this.otherGenerators, this.schemaPath, this.DMMF, this.datasources, this.datamodel, this.binaryPaths, this.ast);

  factory Root.fromJson(Map<String, dynamic> json) => _$RootFromJson(json);
  Map<String, dynamic> toJson() => _$RootToJson(this);
}

@JsonSerializable()
class Generator {
  final dynamic output; //TODO 	Output        *Value         `json:"output"`
  final String name;
  final dynamic provider; //TODO 	Output        *Value         `json:"output"`
  final List<BinaryTarget> binaryTargets;
  final String? pinnedBinaryTarget;
  Generator(this.output, this.name, this.provider, this.binaryTargets, this.pinnedBinaryTarget);

  factory Generator.fromJson(Map<String, dynamic> json) =>
      _$GeneratorFromJson(json);
  Map<String, dynamic> toJson() => _$GeneratorToJson(this);
}

@JsonSerializable()
class BinaryTarget {
  final String fromEnvVar;
  final String value;
  BinaryTarget(this.fromEnvVar, this.value);

  factory BinaryTarget.fromJson(Map<String, dynamic> json) =>
      _$BinaryTargetFromJson(json);
  Map<String, dynamic> toJson() => _$BinaryTargetToJson(this);
}

@JsonSerializable()
class Value {
  final String fromEnvVar;
  final String value;
  Value(this.fromEnvVar, this.value);

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
  Map<String, dynamic> toJson() => _$ValueToJson(this);
}

@JsonSerializable()
class EnvValue {
  final String fromEnvVar;
  final String value;
  EnvValue(this.fromEnvVar, this.value);

  factory EnvValue.fromJson(Map<String, dynamic> json) => _$EnvValueFromJson(json);
  Map<String, dynamic> toJson() => _$EnvValueToJson(this);
}



// typedef ConnectorType =  String;

enum ConnectorType {
mysql,
mongo,
sqlite,
postgresql
}

@JsonSerializable()
class Datasource {
  final String name;
  final ConnectorType connectorType;
  final EnvValue url;
  final Map config;

  Datasource(this.name, this.connectorType, this.url, this.config);

  factory Datasource.fromJson(Map<String, dynamic> json) => _$DatasourceFromJson(json);
  Map<String, dynamic> toJson() => _$DatasourceToJson(this);
}

@JsonSerializable()
class BinaryPaths {
  final Map<String,String> migrationEngine;
  final Map<String,String> queryEngine;
  final Map<String,String> introspectionEngine;

  BinaryPaths(this.migrationEngine, this.queryEngine, this.introspectionEngine);

  factory BinaryPaths.fromJson(Map<String, dynamic> json) => _$BinaryPathsFromJson(json);
  Map<String, dynamic> toJson() => _$BinaryPathsToJson(this);
}