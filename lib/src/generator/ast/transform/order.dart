
import 'package:json_annotation/json_annotation.dart';

part "order.g.dart";

@JsonSerializable()
class OrderBy {

  OrderBy();

  factory OrderBy.fromJson(Map<String, dynamic> json) => _$OrderByFromJson(json);
  Map<String, dynamic> toJson() => _$OrderByToJson(this);
}