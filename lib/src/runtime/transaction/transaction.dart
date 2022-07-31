

import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable()
class TX {
  final Engine engine;
  TX(this.engine);

  transaction( List<Param> queries ){
    
  }
}

// @JsonSerializable()
abstract class Param {
  bool isTX();
  Query extractQuery() ;
  // Param();

  // factory Param.fromJson(Map<String, dynamic> json) => _$ParamFromJson(json);
  // Map<String, dynamic> toJson() => _$ParamToJson(this);
}

