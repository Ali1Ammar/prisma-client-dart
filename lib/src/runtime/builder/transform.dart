import 'package:collection/collection.dart';
import 'package:prisma_dart/src/runtime/builder/builder.dart';

List<Field> transformEquals(List<Field> fields) {
  return fields.map((main) {
    final innerEqual = main.fields?.lastWhereOrNull(
      (element) => element.name == "equals",
    );
    if (innerEqual != null) {
      return Field(main.name, main.list, main.wrapList, innerEqual.value,
          innerEqual.fields);
    }
    return main;
  }).toList();
}
