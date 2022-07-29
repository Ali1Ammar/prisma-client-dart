// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jsonrpc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      json['jsonrpc'] as String,
      json['id'] as int,
      $enumDecode(_$MethodEnumMap, json['method']),
      json['params'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'id': instance.id,
      'method': _$MethodEnumMap[instance.method]!,
      'params': instance.params,
    };

const _$MethodEnumMap = {
  Method.getManifest: 'getManifest',
  Method.generate: 'generate',
};

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      json['id'] as int,
      json['jsonrpc'] as String,
      json['result'],
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'id': instance.id,
      'jsonrpc': instance.jsonrpc,
      'result': instance.result,
    };
