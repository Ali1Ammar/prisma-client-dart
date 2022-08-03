import 'package:code_builder/code_builder.dart';
import 'package:prisma_dart/src/code_builder/helper.dart';
import 'package:prisma_dart/src/code_builder/root.dart';
import 'package:prisma_dart/src/generator/types.dart';

CodePart buildModel() {
  final models = root.dmmf.datamodel.models.map((element) => Class((c) {
        final className = element.name.dartClassCase;
        c.methods.add(Method((m) {
          // factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
          m.name = "toJson";
          m.returns = refer("Map<String, dynamic>");
          m.body = Code("return _\$${className}ToJson(this);");
        }));
        c.constructors.add(Constructor((m) {
          // factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
          m.name = "fromJson";
          m.factory = true;
          m.requiredParameters.add(Parameter((p) {
            p.name = "json";
            p.type = refer("Map<String, dynamic>");
          }));

          m.body = Code("return _\$${className}FromJson(json);");
        }));
        c.annotations.add(CodeExpression(Code('JsonSerializable()')));
        c.name = className;
        var map = element.fields.map((e) => Field((f) {
              f.name = e.name.dartCase;
              String type = e.type.toDartType();
              f.annotations
                  .add(CodeExpression(Code('JsonKey(name: "${e.name}")')));
              if (e.isList) {
                type = "List<$type>";
              }
              if (!e.isRequired || e.kind.isRelation()) {
                type += "?";
              }
              f.type = refer(type);

              f.modifier = FieldModifier.final$;
            }));
        final requireds = fieldsToRequiredParameters(map);
        c.fields.addAll(map);
        c.constructors.add(Constructor((c) {
          c.requiredParameters.addAll(requireds);
        }));
      }));
  return CodePart([
    Directive.import("package:json_annotation/json_annotation.dart"),
    Directive.import("enum.dart"),
        Directive.part("models.g.dart"),

    ...models
  ], "models");
}
