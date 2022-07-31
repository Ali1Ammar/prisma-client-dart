import 'package:json_annotation/json_annotation.dart';
import 'package:prisma_dart/src/generator/ast/dmmf/dmmf.dart';
import 'package:prisma_dart/src/generator/ast/transform/ast.dart';

part "generator.g.dart";

@JsonSerializable()
class Root {
  final Generator generator;
  final List<Generator> otherGenerators;
  final String schemaPath;
  final Document dmmf;
  final List<Datasource> datasources;
  final String datamodel;
  final BinaryPaths? binaryPaths;
  @JsonKey(ignore: true)
  late AST ast; 
  Root(this.generator, this.otherGenerators, this.schemaPath, this.dmmf, this.datasources, this.datamodel, this.binaryPaths);

  factory Root.fromJson(Map<String, dynamic> json) => _$RootFromJson(json);
  Map<String, dynamic> toJson() => _$RootToJson(this);
}

@JsonSerializable()
class Config {
  final String? engineType;
  @JsonKey(defaultValue: "db")
  final String package;
  final String? disableGitignore;
  final String? disableGoBinaries; //TODO has go in its name ???
  Config(this.engineType, this.disableGitignore, this.disableGoBinaries , [this.package="db"]);

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}

@JsonSerializable()
class Generator {
  final Value output; //TODO 	Output        *Value         `json:"output"`
  final String name;
  final Value provider; //TODO 	Output        *Value         `json:"output"`
  final Config config;
  final List<BinaryTarget> binaryTargets;
  final String? pinnedBinaryTarget;
  Generator(this.output, this.name, this.provider, this.binaryTargets, this.pinnedBinaryTarget, this.config);

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
  final String? fromEnvVar;
  final String value;
  Value(this.fromEnvVar, this.value);

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
  Map<String, dynamic> toJson() => _$ValueToJson(this);
}

@JsonSerializable()
class EnvValue {
  final String fromEnvVar;
  final String? value;
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

ConnectorType? toConnectorType(String? name)=>name==null?null:ConnectorType.values.byName(name);
String? fromConnectorType(ConnectorType? type)=>type?.name;

@JsonSerializable()
class Datasource {
  final String name;
  @JsonKey(fromJson: toConnectorType, toJson: fromConnectorType)
  final ConnectorType? connectorType;
  final EnvValue url;
  final Map? config;

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