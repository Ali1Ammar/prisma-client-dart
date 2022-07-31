


import 'package:json_annotation/json_annotation.dart';

part "types.g.dart";

@JsonSerializable()
class BatchResult {
  final int count;

  BatchResult(this.count);

  factory BatchResult.fromJson(Map<String, dynamic> json) => _$BatchResultFromJson(json);
  Map<String, dynamic> toJson() => _$BatchResultToJson(this);
}

//TODO a lot of other types didnt needed for now