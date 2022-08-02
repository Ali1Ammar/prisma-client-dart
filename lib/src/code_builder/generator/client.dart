import 'package:code_builder/code_builder.dart';
import 'package:prisma_dart/src/code_builder/helper.dart';
import 'package:prisma_dart/src/code_builder/root.dart';

CodePart buildPrismaClient() {
  final imports = [
Directive.import('package:http/http.dart'),
Directive.import('package:prisma_dart/src/engine/query_engine.dart'),
Directive.import('package:prisma_dart/src/runtime/lifecycle/lifecycle.dart'),
Directive.import('package:prisma_dart/src/runtime/raw/raw.dart'),
Directive.import('package:prisma_dart/src/runtime/transaction/transaction.dart'),
Directive.import('../engine/query_engine_linuxs_gen.dart'),
Directive.import('datamodel.dart')

  ];
  final client = Class((b) {
    b.name = 'PrismaClient';
    final fields = [
      Field((b) {
        b.name = 'engine';
        b.modifier = FieldModifier.final$;

        b.type = refer('QueryEngine');
      }),
      Field((b) {
        b.name = 'action';
        b.modifier = FieldModifier.final$;
        b.type = refer('PrismaActions');
      }),
    ];
    b.fields.addAll(fields);
    b.constructors.add(Constructor((cons) {
      cons.name = "newClient";

      cons.requiredParameters.addAll(fieldsToRequiredParameters(fields));
    }));

    b.constructors.add(Constructor((cons) {
      cons.factory = true;
      StringBuffer buffer = StringBuffer();
      //TODO ,ove datamodel to its own file
      buffer.write("""
    init();
    final engine = QueryEngine(
        Client(), datamodel, ${root.generator.binaryTargets.isNotEmpty});
    return PrismaClient.newClient(
        engine, PrismaActions(Lifecycle(engine), Raw(engine), TX(engine)));
""");
      cons.body = Code(buffer.toString());
    }));
  });
  var iterable = [
    Field((f) => f
      ..modifier = FieldModifier.final$
      ..name = 'lifecycle'
      ..type = refer('Lifecycle')),
    Field((f) => f
      ..modifier = FieldModifier.final$
      ..name = 'raw'
      ..type = refer('Raw')),
    Field((f) => f
      ..modifier = FieldModifier.final$
      ..name = 'tx'
      ..type = refer('TX'))
  ];
  final prismaAction = Class((b) {
    b.name = 'PrismaActions';

    b.fields.addAll(iterable);

    b.constructors.add(Constructor((c) {
      c.requiredParameters.addAll(fieldsToRequiredParameters(iterable));
    }));
  });

  return CodePart([...imports,client, prismaAction], "client");
}
