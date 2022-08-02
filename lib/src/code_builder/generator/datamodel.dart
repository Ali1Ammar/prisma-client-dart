import 'package:code_builder/code_builder.dart';
import 'package:prisma_dart/src/code_builder/root.dart';

CodePart buildDataModelField() {
  return CodePart([
    Field((f) {
      f.name = "datamodel";
      f.modifier = FieldModifier.constant;
      f.assignment = Code('"""${root.datamodel}"""');
    })
  ], 'datamodel',false);
}
