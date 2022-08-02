
import 'package:code_builder/code_builder.dart';
import 'package:prisma_dart/src/generator/generator.dart';

late Root root;

class CodePart {
  final List<Spec> code;
  final String name;
  final bool exportToUser;

  CodePart(this.code, this.name, [this.exportToUser=true]);
}