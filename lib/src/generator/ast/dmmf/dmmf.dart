import 'package:json_annotation/json_annotation.dart';

part "dmmf.g.dart";

enum FieldKind {
  scalar("scalar"),
  object("object"),
  enumz("enum");

  const FieldKind(this.name);
  final String name;

  bool includeInStruct() => this == FieldKind.scalar || this == FieldKind.enumz;
  bool isRelation() => this == FieldKind.object;
}

enum DatamodelFieldKind {
  scalar("scalar"),
  relation("relation"),
  enumz("enum");

  const DatamodelFieldKind(this.name);
  final String name;

  bool includeInStruct() =>
      this == DatamodelFieldKind.scalar || this == DatamodelFieldKind.enumz;
  bool isRelation() => this == DatamodelFieldKind.relation;
}

@JsonSerializable()
class Document {
  final Datamodel datamodel;
  final Schema schema;
  final Mappings mappings;

  Document(this.datamodel, this.schema, this.mappings);

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}

@JsonSerializable()
class Mappings {
  final List<ModelOperation> modelOperations;
  final OtherOperations otherOperations;
  Mappings(this.modelOperations, this.otherOperations);

  factory Mappings.fromJson(Map<String, dynamic> json) =>
      _$MappingsFromJson(json);
  Map<String, dynamic> toJson() => _$MappingsToJson(this);
}

@JsonSerializable()
class OtherOperations {
  final List<String> read;
  final List<String> write;
  OtherOperations(this.read, this.write);

  factory OtherOperations.fromJson(Map<String, dynamic> json) =>
      _$OtherOperationsFromJson(json);
  Map<String, dynamic> toJson() => _$OtherOperationsToJson(this);
}

@JsonSerializable()
class ModelOperation {
  final String model;
  final String aggregate;
  final String createOne;
  final String deleteMany;
  final String deleteOne;
  final String findFirst;
  final String findMany;
  final String findUnique;
  final String groupBy;
  final String updateMany;
  final String updateOne;
  final String upsertOne;

  ModelOperation(
      this.model,
      this.aggregate,
      this.createOne,
      this.deleteMany,
      this.deleteOne,
      this.findFirst,
      this.findMany,
      this.findUnique,
      this.groupBy,
      this.updateMany,
      this.updateOne,
      this.upsertOne);

  factory ModelOperation.fromJson(Map<String, dynamic> json) =>
      _$ModelOperationFromJson(json);
  Map<String, dynamic> toJson() => _$ModelOperationToJson(this);

  // String nameSpace() => model.dartCase(); //TODO dmmf.go : 77
}

// @JsonSerializable()
class Operator {
  final String name;
  final String action;
  const Operator(this.name, this.action);

  // factory Operator.fromJson(Map<String, dynamic> json) =>
  //     _$OperatorFromJson(json);
  // Map<String, dynamic> toJson() => _$OperatorToJson(this);

  static const List<Operator> operators = [
    Operator("Not", "NOT"),
    Operator("Or", "OR"),
    Operator("And", "AND"),
  ];
}

// @JsonSerializable()
class Action {
  final String type;
  final String name;
  const Action(this.type, this.name);

  // factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);
  // Map<String, dynamic> toJson() => _$ActionToJson(this);

  static const actions = [
    Action("query", "Find"),
    Action("mutation", "Create"),
    Action("mutation", "Update"),
    Action("mutation", "Delete"),
  ];
}

// @JsonSerializable()
class ActionType {
  final String name;
  final String innerName;
  final bool list;
  final bool returnList;
  const ActionType(this.name, this.innerName, this.list, this.returnList);

  // factory ActionType.fromJson(Map<String, dynamic> json) => _$ActionTypeFromJson(json);
  // Map<String, dynamic> toJson() => _$ActionTypeToJson(this);

  static const variations = [
    ActionType("Unique", "One", false, false),
    ActionType("First", "One", true, false),
    ActionType("Many", "Many", true, true),
  ];

  static const types = ["Unique", "Many"];
  // func (Document) Types() []string {
// 	return []string{"Unique", "Many"}
// }
}

@JsonSerializable()
class Method {
  final String name;
  final String action;

  const Method(this.name, this.action);

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);
  Map<String, dynamic> toJson() => _$MethodToJson(this);
}

@JsonSerializable()
class Type {
  final String name;
  final List<Method> methods;

  const Type(this.name, this.methods);

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
  Map<String, dynamic> toJson() => _$TypeToJson(this);

  static const number = [
    Method("Increment", "increment"),
    Method("Decrement", "decrement"),
    Method("Multiply", "multiply"),
    Method("Divide", "divide"),
  ];
  static const writeTypes = [
    Type("Int", number),
    Type("Float", number),
  ];
}

@JsonSerializable()
class SchemaEnum {
  final String name;
  final List<String> values;
  final String dbName;

  const SchemaEnum(this.name, this.values, this.dbName);

  factory SchemaEnum.fromJson(Map<String, dynamic> json) =>
      _$SchemaEnumFromJson(json);

  Map<String, dynamic> toJson() => _$SchemaEnumToJson(this);
}

@JsonSerializable()
class Enumz {
  final String name;
  final List<String> values;
  final String dbName;

  const Enumz(this.name, this.values, this.dbName);

  factory Enumz.fromJson(Map<String, dynamic> json) => _$EnumzFromJson(json);
  Map<String, dynamic> toJson() => _$EnumzToJson(this);
}

@JsonSerializable()
class EnumValue {
  final String name;
  final String dbName;

  const EnumValue(this.name, this.dbName);

  factory EnumValue.fromJson(Map<String, dynamic> json) =>
      _$EnumValueFromJson(json);
  Map<String, dynamic> toJson() => _$EnumValueToJson(this);
}

@JsonSerializable()
class Datamodel {
  final List<Model> models;
  final List<Enumz> enums;

  Datamodel(this.models, this.enums);
  factory Datamodel.fromJson(Map<String, dynamic> json) =>
      _$DatamodelFromJson(json);
  Map<String, dynamic> toJson() => _$DatamodelToJson(this);
}

@JsonSerializable()
class UniqueIndex {
  final String name; // InternalName
  final List<String> fields;

  const UniqueIndex(this.name, this.fields);
  factory UniqueIndex.fromJson(Map<String, dynamic> json) =>
      _$UniqueIndexFromJson(json);
  Map<String, dynamic> toJson() => _$UniqueIndexToJson(this);
}

@JsonSerializable()
class Model {
  final String name;
  final bool isEmbedded;
  final String dbName;
  final List<Field> fields;
  final List<UniqueIndex> uniqueIndexes;
  final PrimaryKey primaryKey;

  const Model(this.name, this.dbName, this.fields, this.uniqueIndexes,
      this.isEmbedded, this.primaryKey);
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);

  static const actions = ["Set", "Equals"];
  List<Field> relationFieldsPlusOne() {
    return fields
        .where((f) => f.kind.isRelation())
        .toList(); //TODO we may add empty field
  }
//   func (m Model) RelationFieldsPlusOne() []Field {//TODOdmmf.go :  245
// 	var fields []Field
// 	for _, field := range m.Fields {
// 		if field.Kind.IsRelation() {
// 			fields = append(fields, field)
// 		}
// 	}
// 	fields = append(fields, Field{})
// 	return fields
// }
}

@JsonSerializable()
class PrimaryKey {
  final String name;
  final List<String> fields;

  const PrimaryKey(
    this.name,
    this.fields,
  );
  factory PrimaryKey.fromJson(Map<String, dynamic> json) =>
      _$PrimaryKeyFromJson(json);
  Map<String, dynamic> toJson() => _$PrimaryKeyToJson(this);
}

@JsonSerializable()
class Field {
  final FieldKind kind;
  final String name;
  final bool isRequired;
  final bool isList;
  final bool isUnique;
  final bool isReadOnly;
  final bool isId;
  final Type type;

  final String? dbName;
  final bool isGenerated;
  final bool isUpdatedAt;
  final List<dynamic>? relationToFields;
  final String? relationOnDelete;
  final String? relationName;
  final bool hasDefaultValue;

  Field(
      this.kind,
      this.name,
      this.isRequired,
      this.isList,
      this.isUnique,
      this.isReadOnly,
      this.isId,
      this.type,
      this.dbName,
      this.isGenerated,
      this.isUpdatedAt,
      this.relationToFields,
      this.relationOnDelete,
      this.relationName,
      this.hasDefaultValue);

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
  Map<String, dynamic> toJson() => _$FieldToJson(this);

  bool requiredOnCreate() {
    if (!isRequired || isUpdatedAt || hasDefaultValue || isReadOnly || isList) {
      return false;
    }

    if (relationName != "" && isList) {
      return false;
    }

    return true;
  }

  List<RelationMethod> relationMethods() {
    if (isList) {
      return [RelationMethod("Some", "some"), RelationMethod("Every", "every")];
    }
    return [RelationMethod("Where", "is")];
  }
}

class RelationMethod {
  final String name;
  final String action;

  RelationMethod(this.name, this.action);
}

@JsonSerializable()
class Schema {
  final String rootQueryType;
  final String? rootMutationType;
  final InputObjectType inputObjectTypes;
  final OutputObject outputObjectTypes;
  final EnumTypes enumTypes;

  Schema(this.rootQueryType, this.rootMutationType, this.inputObjectTypes,
      this.outputObjectTypes, this.enumTypes);

  factory Schema.fromJson(Map<String, dynamic> json) => _$SchemaFromJson(json);

  Map<String, dynamic> toJson() => _$SchemaToJson(this);
}

@JsonSerializable()
class EnumTypes {
  final List<SchemaEnum> prisma;
  final List<SchemaEnum> model;
  EnumTypes(this.prisma, this.model);

  factory EnumTypes.fromJson(Map<String, dynamic> json) =>
      _$EnumTypesFromJson(json);
  Map<String, dynamic> toJson() => _$EnumTypesToJson(this);
}

@JsonSerializable()
class InputObjectType {
  final List<CoreType> prisma;
  InputObjectType(this.prisma);

  factory InputObjectType.fromJson(Map<String, dynamic> json) =>
      _$InputObjectTypeFromJson(json);
  Map<String, dynamic> toJson() => _$InputObjectTypeToJson(this);
}

@JsonSerializable()
class OutputObject {
  final List<CoreType> prisma;
  OutputObject(this.prisma);

  factory OutputObject.fromJson(Map<String, dynamic> json) =>
      _$OutputObjectFromJson(json);
  Map<String, dynamic> toJson() => _$OutputObjectToJson(this);
}

@JsonSerializable()
class OuterInputType {
  final String name;
  final List<SchemaInputType> inputTypes;
  final bool? isRelationFilter;
  OuterInputType(this.name, this.inputTypes, this.isRelationFilter);

  factory OuterInputType.fromJson(Map<String, dynamic> json) =>
      _$OuterInputTypeFromJson(json);
  Map<String, dynamic> toJson() => _$OuterInputTypeToJson(this);
}

@JsonSerializable()
class SchemaInputType {
  final bool isRequired;
  final bool isList;
  final String type;
  final FieldKind kind;
  final String namespace;
  final String location;
  SchemaInputType(this.isRequired, this.isList, this.type, this.kind,
      this.namespace, this.location);

  factory SchemaInputType.fromJson(Map<String, dynamic> json) =>
      _$SchemaInputTypeFromJson(json);
  Map<String, dynamic> toJson() => _$SchemaInputTypeToJson(this);
}

@JsonSerializable()
class OutputType {
  final String name;
  final List<SchemaField> fields;
  OutputType(this.name, this.fields);

  factory OutputType.fromJson(Map<String, dynamic> json) =>
      _$OutputTypeFromJson(json);
  Map<String, dynamic> toJson() => _$OutputTypeToJson(this);
}

@JsonSerializable()
class SchemaField {
  final String name;
  final SchemaOutputType outputType;
  final List<OuterInputType> args;
  SchemaField(this.name, this.outputType, this.args);

  factory SchemaField.fromJson(Map<String, dynamic> json) =>
      _$SchemaFieldFromJson(json);
  Map<String, dynamic> toJson() => _$SchemaFieldToJson(this);
}

@JsonSerializable()
class SchemaOutputType {
  final String type;
  final bool isList;
  final bool isRequired;
  final FieldKind kind;
  SchemaOutputType(this.type, this.isList, this.isRequired, this.kind);

  factory SchemaOutputType.fromJson(Map<String, dynamic> json) =>
      _$SchemaOutputTypeFromJson(json);
  Map<String, dynamic> toJson() => _$SchemaOutputTypeToJson(this);
}

@JsonSerializable()
class CoreType {
  final String name;
  final bool? isWhereType;
  final bool? isOrderType;
  final bool? atLeastOne;
  final bool? atMostOne;
  final List<OuterInputType> fields;
  CoreType(this.name, this.isWhereType, this.isOrderType, this.atLeastOne,
      this.atMostOne, this.fields);

  factory CoreType.fromJson(Map<String, dynamic> json) =>
      _$CoreTypeFromJson(json);
  Map<String, dynamic> toJson() => _$CoreTypeToJson(this);
}
