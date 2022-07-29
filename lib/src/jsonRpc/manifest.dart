import 'package:json_annotation/json_annotation.dart';

part 'manifest.g.dart';

@JsonSerializable()
class Manifest {
  final String prettyName;
  final String? defaultOutput;
  final List<String>? denylist;
  final List<String>? requiresGenerators;
  final List<String>? requiresEngines;

  Manifest(
      {required this.prettyName,
      this.defaultOutput,
      this.denylist,
      this.requiresGenerators,
      this.requiresEngines});

  factory Manifest.fromJson(Map<String, dynamic> json) =>
      _$ManifestFromJson(json);

  Map<String, dynamic> toJson() => _$ManifestToJson(this);
}

@JsonSerializable()
class ManifestResponse {
  final Manifest manifest;

  ManifestResponse({required this.manifest});

  factory ManifestResponse.fromJson(Map<String, dynamic> json) =>
      _$ManifestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ManifestResponseToJson(this);
}
