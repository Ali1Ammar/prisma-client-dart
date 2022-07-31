// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manifest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Manifest _$ManifestFromJson(Map<String, dynamic> json) => Manifest(
      prettyName: json['prettyName'] as String,
      defaultOutput: json['defaultOutput'] as String?,
      denylist: (json['denylist'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      requiresGenerators: (json['requiresGenerators'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      requiresEngines: (json['requiresEngines'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ManifestToJson(Manifest instance) => <String, dynamic>{
      'prettyName': instance.prettyName,
      'defaultOutput': instance.defaultOutput,
      'denylist': instance.denylist,
      'requiresGenerators': instance.requiresGenerators,
      'requiresEngines': instance.requiresEngines,
    };

ManifestResponse _$ManifestResponseFromJson(Map<String, dynamic> json) =>
    ManifestResponse(
      manifest: Manifest.fromJson(json['manifest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManifestResponseToJson(ManifestResponse instance) =>
    <String, dynamic>{
      'manifest': instance.manifest.toJson(),
    };
