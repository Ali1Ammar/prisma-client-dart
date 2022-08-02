

import 'package:code_builder/code_builder.dart';
import 'package:prisma_dart/src/code_builder/root.dart';

Library buildExportFile(List<CodePart> files){
  final exports = files.where((e) => e.exportToUser ).map((e) =>  Directive.export("src/${e.name}.dart") );
  return Library((lib) {
    lib.body.addAll(exports);
  });
}