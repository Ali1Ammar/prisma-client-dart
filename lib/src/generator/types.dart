import 'package:prisma_dart/src/generator/helper/keyword.dart';
import 'package:recase/recase.dart';

extension StringCase on String {
  String get dartCase => handleKeyWord(camelCase);
  String get dartClassCase => pascalCase;

  // String get camelCase => camelCase;
  String get privateDartCase => "_$camelCase"; // replace for GoLowerCase

  String get prismaDartCase => "${titleCase}_";

  String get prismaInternalCase => "_${this}";
}
