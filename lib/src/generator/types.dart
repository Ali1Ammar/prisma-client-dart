import 'package:recase/recase.dart';

extension StringCase on String {
  String get dartCase => camelCase;
  // String get camelCase => camelCase;
  String get privateDartCase => "_$camelCase"; // replace for GoLowerCase

  String get prismaDartCase => "${titleCase}_" ;

  String get prismaInternalCase => "_${this}" ;

}