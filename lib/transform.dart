import 'package:prisma_dart/src/generator/ast/transform/ast.dart';
import 'package:prisma_dart/src/generator/generator.dart';

AST transform(Root input) {
  final ast = AST(input.dmmf);
  input.ast = ast;
  return ast;
}
