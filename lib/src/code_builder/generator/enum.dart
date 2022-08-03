import 'package:code_builder/code_builder.dart';
import 'package:prisma_dart/src/code_builder/root.dart';
import 'package:prisma_dart/src/generator/types.dart';

CodePart buildEnum() {
  final code = Code("""abstract class PrismaEnum {
  String get \$name\$;
}
""");

  final enumClass = root.dmmf.datamodel.enums.map((e) {
    return Code(generateEnum(
        e.name.dartClassCase, e.values.map((e) => e.name).toList()));
  });

  final internalEnumClass = root.dmmf.schema.enumTypes.prisma.map((e) {
    return Code(
        generateEnum(e.name.dartClassCase, e.values.map((e) => e).toList()));
  });

  return CodePart([
    code,
    ...internalEnumClass, ...enumClass
  ], "enum");
}

String generateEnum(String className, List<String> fields) {
  final builder = StringBuffer();
  builder.write("enum ");
  builder.write(className);
  builder.write(" implements  PrismaEnum  {");
  for (int i = 0; i < fields.length; i++) {
    var field = fields[i];
    builder.write(field.dartCase);
    builder.write('("');
    builder.write(field);
    if (i == fields.length - 1) {
      builder.writeln('");');
    } else {
      builder.writeln('"),');
    }
  }
  builder.write(" @override final String \$name\$; const ");
  builder.write(className);
  builder.writeln("(this.\$name\$); }");
  return builder.toString();
}

