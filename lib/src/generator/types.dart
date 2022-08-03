import 'package:prisma_dart/src/generator/helper/keyword.dart';
import 'package:recase/recase.dart';

extension StringCase on String {
  String get dartCase => handleKeyWord(camelCase);
  String get dartClassCase => pascalCase;

  // String get camelCase => camelCase;
  String get privateDartCase => "_$camelCase"; // replace for GoLowerCase

  String get prismaDartCase => "${titleCase}_";

  String get prismaInternalCase => "_${this}";

  String toDartType(){
  if(this=="Int" || this=="BigInt") return "int";
  if(this=="Float" || this=="Decimal") return "double";
  if(this=="Boolean") return "bool";
  if(this=="Json") return "dynamic";
  if(this=="String") return "String";
  if(this=="DateTime") return "DateTime";
  if(this=="Bytes") return "dynamic";//TODO
  if(this=="Unsupported") return "dynamic";
  return dartClassCase;
}
}
