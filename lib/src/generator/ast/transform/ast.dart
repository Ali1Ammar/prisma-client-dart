
import 'package:json_annotation/json_annotation.dart';
import 'package:prisma_dart/src/generator/ast/dmmf/dmmf.dart' as dmmf_file;
import 'package:prisma_dart/src/generator/ast/transform/enum.dart';
import 'package:prisma_dart/src/generator/ast/transform/model.dart';
import 'package:prisma_dart/src/generator/ast/transform/order.dart';
import 'package:prisma_dart/src/generator/ast/transform/read_filter.dart' as read;

import 'filters.dart';

@JsonSerializable()
class AST {
  @JsonKey(ignore: true)
  final dmmf_file.Document dmmf;
  late List<String> scalars;
  late List<Enumz> enums=Enumz.enums(dmmf);
  late List<Model> models= Model.models(dmmf) ;
  late List<Filter> readFilters=read.readFilters(this);
  late List<Filter> writeFilters=;
  late List<OrderBy> orderBys=[];
  AST();

  factory AST.fromJson(Map<String, dynamic> json) => _$ASTFromJson(json);
  Map<String, dynamic> toJson() => _$ASTToJson(this);



 dmmf_file.CoreType? pick(List<String> names)  {
	for (final name in names) {
		for(final i in  dmmf.schema.inputObjectTypes.prisma  ){
			if (i.name == name) {
				return i;
			}
		}
	}
	return null;
}


}