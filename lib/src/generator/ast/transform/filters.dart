
import 'package:json_annotation/json_annotation.dart';

part "filters.g.dart";

@JsonSerializable()
class Method {
  final String name;
  final String action;
  final bool isList;
  final String deprecated;
  final String type;
  Method(this.name, this.action, this.isList, this.deprecated, this.type);

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);
  Map<String, dynamic> toJson() => _$MethodToJson(this);
}

@JsonSerializable()
class Filter {
 final String name;
 final List<Method> methods;
  Filter(this.name, this.methods);

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}