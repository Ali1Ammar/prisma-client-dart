import 'package:prisma_dart/src/generator/ast/transform/ast.dart';

List<String> scalars(AST ast) {
  List<String> scalars = [];
  for (final item in ast.dmmf.schema.inputObjectTypes.prisma) {
    for (var field in item.fields) {
      for (var input in field.inputTypes??[]) {
        if (input.location != "scalar") {
          continue;
        }
        final name = input.type;
        bool exists = false;
        for (final scalar in scalars) {
          
          // prevent duplicate items
          if (scalar == name) {
            exists = true;
            break;
          }
        }
        if (exists) continue;

        scalars.add(name);
      }
    }
  }
  return scalars;
}
