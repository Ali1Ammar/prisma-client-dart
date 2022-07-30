// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dmmf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      Datamodel.fromJson(json['datamodel'] as Map<String, dynamic>),
      Schema.fromJson(json['schema'] as Map<String, dynamic>),
      Mappings.fromJson(json['mappings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'datamodel': instance.datamodel,
      'schema': instance.schema,
      'mappings': instance.mappings,
    };

Mappings _$MappingsFromJson(Map<String, dynamic> json) => Mappings(
      (json['modelOperations'] as List<dynamic>)
          .map((e) => ModelOperation.fromJson(e as Map<String, dynamic>))
          .toList(),
      OtherOperations.fromJson(json['otherOperations'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MappingsToJson(Mappings instance) => <String, dynamic>{
      'modelOperations': instance.modelOperations,
      'otherOperations': instance.otherOperations,
    };

OtherOperations _$OtherOperationsFromJson(Map<String, dynamic> json) =>
    OtherOperations(
      (json['read'] as List<dynamic>).map((e) => e as String).toList(),
      (json['write'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$OtherOperationsToJson(OtherOperations instance) =>
    <String, dynamic>{
      'read': instance.read,
      'write': instance.write,
    };

ModelOperation _$ModelOperationFromJson(Map<String, dynamic> json) =>
    ModelOperation(
      json['model'] as String,
      json['aggregate'] as String,
      json['createOne'] as String,
      json['deleteMany'] as String,
      json['deleteOne'] as String,
      json['findFirst'] as String,
      json['findMany'] as String,
      json['findUnique'] as String,
      json['groupBy'] as String,
      json['updateMany'] as String,
      json['updateOne'] as String,
      json['upsertOne'] as String,
    );

Map<String, dynamic> _$ModelOperationToJson(ModelOperation instance) =>
    <String, dynamic>{
      'model': instance.model,
      'aggregate': instance.aggregate,
      'createOne': instance.createOne,
      'deleteMany': instance.deleteMany,
      'deleteOne': instance.deleteOne,
      'findFirst': instance.findFirst,
      'findMany': instance.findMany,
      'findUnique': instance.findUnique,
      'groupBy': instance.groupBy,
      'updateMany': instance.updateMany,
      'updateOne': instance.updateOne,
      'upsertOne': instance.upsertOne,
    };

Method _$MethodFromJson(Map<String, dynamic> json) => Method(
      json['name'] as String,
      json['action'] as String,
    );

Map<String, dynamic> _$MethodToJson(Method instance) => <String, dynamic>{
      'name': instance.name,
      'action': instance.action,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      json['name'] as String,
      (json['methods'] as List<dynamic>)
          .map((e) => Method.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'name': instance.name,
      'methods': instance.methods,
    };

SchemaEnum _$SchemaEnumFromJson(Map<String, dynamic> json) => SchemaEnum(
      json['name'] as String,
      (json['values'] as List<dynamic>).map((e) => e as String).toList(),
      json['dbName'] as String,
    );

Map<String, dynamic> _$SchemaEnumToJson(SchemaEnum instance) =>
    <String, dynamic>{
      'name': instance.name,
      'values': instance.values,
      'dbName': instance.dbName,
    };

Enumz _$EnumzFromJson(Map<String, dynamic> json) => Enumz(
      json['name'] as String,
      (json['values'] as List<dynamic>).map((e) => e as String).toList(),
      json['dbName'] as String,
    );

Map<String, dynamic> _$EnumzToJson(Enumz instance) => <String, dynamic>{
      'name': instance.name,
      'values': instance.values,
      'dbName': instance.dbName,
    };

EnumValue _$EnumValueFromJson(Map<String, dynamic> json) => EnumValue(
      json['name'] as String,
      json['dbName'] as String,
    );

Map<String, dynamic> _$EnumValueToJson(EnumValue instance) => <String, dynamic>{
      'name': instance.name,
      'dbName': instance.dbName,
    };

Datamodel _$DatamodelFromJson(Map<String, dynamic> json) => Datamodel(
      (json['models'] as List<dynamic>)
          .map((e) => Model.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['enums'] as List<dynamic>)
          .map((e) => Enumz.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DatamodelToJson(Datamodel instance) => <String, dynamic>{
      'models': instance.models,
      'enums': instance.enums,
    };

UniqueIndex _$UniqueIndexFromJson(Map<String, dynamic> json) => UniqueIndex(
      json['name'] as String,
      (json['fields'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UniqueIndexToJson(UniqueIndex instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fields': instance.fields,
    };

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      json['name'] as String,
      json['dbName'] as String,
      (json['fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['uniqueIndexes'] as List<dynamic>)
          .map((e) => UniqueIndex.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isEmbedded'] as bool,
      PrimaryKey.fromJson(json['primaryKey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'name': instance.name,
      'isEmbedded': instance.isEmbedded,
      'dbName': instance.dbName,
      'fields': instance.fields,
      'uniqueIndexes': instance.uniqueIndexes,
      'primaryKey': instance.primaryKey,
    };

PrimaryKey _$PrimaryKeyFromJson(Map<String, dynamic> json) => PrimaryKey(
      json['name'] as String,
      (json['fields'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PrimaryKeyToJson(PrimaryKey instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fields': instance.fields,
    };

Field _$FieldFromJson(Map<String, dynamic> json) => Field(
      $enumDecode(_$FieldKindEnumMap, json['kind']),
      json['name'] as String,
      json['isRequired'] as bool,
      json['isList'] as bool,
      json['isUnique'] as bool,
      json['isReadOnly'] as bool,
      json['isId'] as bool,
      Type.fromJson(json['type'] as Map<String, dynamic>),
      json['dbName'] as String?,
      json['isGenerated'] as bool,
      json['isUpdatedAt'] as bool,
      json['relationToFields'] as List<dynamic>?,
      json['relationOnDelete'] as String?,
      json['relationName'] as String?,
      json['hasDefaultValue'] as bool,
    );

Map<String, dynamic> _$FieldToJson(Field instance) => <String, dynamic>{
      'kind': _$FieldKindEnumMap[instance.kind]!,
      'name': instance.name,
      'isRequired': instance.isRequired,
      'isList': instance.isList,
      'isUnique': instance.isUnique,
      'isReadOnly': instance.isReadOnly,
      'isId': instance.isId,
      'type': instance.type,
      'dbName': instance.dbName,
      'isGenerated': instance.isGenerated,
      'isUpdatedAt': instance.isUpdatedAt,
      'relationToFields': instance.relationToFields,
      'relationOnDelete': instance.relationOnDelete,
      'relationName': instance.relationName,
      'hasDefaultValue': instance.hasDefaultValue,
    };

const _$FieldKindEnumMap = {
  FieldKind.scalar: 'scalar',
  FieldKind.object: 'object',
  FieldKind.enumz: 'enumz',
};

Schema _$SchemaFromJson(Map<String, dynamic> json) => Schema(
      json['rootQueryType'] as String,
      json['rootMutationType'] as String?,
      InputObjectType.fromJson(
          json['inputObjectTypes'] as Map<String, dynamic>),
      OutputObject.fromJson(json['outputObjectTypes'] as Map<String, dynamic>),
      EnumTypes.fromJson(json['enumTypes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SchemaToJson(Schema instance) => <String, dynamic>{
      'rootQueryType': instance.rootQueryType,
      'rootMutationType': instance.rootMutationType,
      'inputObjectTypes': instance.inputObjectTypes,
      'outputObjectTypes': instance.outputObjectTypes,
      'enumTypes': instance.enumTypes,
    };

EnumTypes _$EnumTypesFromJson(Map<String, dynamic> json) => EnumTypes(
      (json['prisma'] as List<dynamic>)
          .map((e) => SchemaEnum.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['model'] as List<dynamic>)
          .map((e) => SchemaEnum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EnumTypesToJson(EnumTypes instance) => <String, dynamic>{
      'prisma': instance.prisma,
      'model': instance.model,
    };

InputObjectType _$InputObjectTypeFromJson(Map<String, dynamic> json) =>
    InputObjectType(
      (json['prisma'] as List<dynamic>)
          .map((e) => CoreType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InputObjectTypeToJson(InputObjectType instance) =>
    <String, dynamic>{
      'prisma': instance.prisma,
    };

OutputObject _$OutputObjectFromJson(Map<String, dynamic> json) => OutputObject(
      (json['prisma'] as List<dynamic>)
          .map((e) => CoreType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OutputObjectToJson(OutputObject instance) =>
    <String, dynamic>{
      'prisma': instance.prisma,
    };

OuterInputType _$OuterInputTypeFromJson(Map<String, dynamic> json) =>
    OuterInputType(
      json['name'] as String,
      (json['inputTypes'] as List<dynamic>)
          .map((e) => SchemaInputType.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isRelationFilter'] as bool?,
    );

Map<String, dynamic> _$OuterInputTypeToJson(OuterInputType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'inputTypes': instance.inputTypes,
      'isRelationFilter': instance.isRelationFilter,
    };

SchemaInputType _$SchemaInputTypeFromJson(Map<String, dynamic> json) =>
    SchemaInputType(
      json['isRequired'] as bool,
      json['isList'] as bool,
      Type.fromJson(json['type'] as Map<String, dynamic>),
      $enumDecode(_$FieldKindEnumMap, json['kind']),
      json['namespace'] as String,
      json['location'] as String,
    );

Map<String, dynamic> _$SchemaInputTypeToJson(SchemaInputType instance) =>
    <String, dynamic>{
      'isRequired': instance.isRequired,
      'isList': instance.isList,
      'type': instance.type,
      'kind': _$FieldKindEnumMap[instance.kind]!,
      'namespace': instance.namespace,
      'location': instance.location,
    };

OutputType _$OutputTypeFromJson(Map<String, dynamic> json) => OutputType(
      json['name'] as String,
      (json['fields'] as List<dynamic>)
          .map((e) => SchemaField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OutputTypeToJson(OutputType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fields': instance.fields,
    };

SchemaField _$SchemaFieldFromJson(Map<String, dynamic> json) => SchemaField(
      json['name'] as String,
      SchemaOutputType.fromJson(json['outputType'] as Map<String, dynamic>),
      (json['args'] as List<dynamic>)
          .map((e) => OuterInputType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SchemaFieldToJson(SchemaField instance) =>
    <String, dynamic>{
      'name': instance.name,
      'outputType': instance.outputType,
      'args': instance.args,
    };

SchemaOutputType _$SchemaOutputTypeFromJson(Map<String, dynamic> json) =>
    SchemaOutputType(
      json['type'] as String,
      json['isList'] as bool,
      json['isRequired'] as bool,
      $enumDecode(_$FieldKindEnumMap, json['kind']),
    );

Map<String, dynamic> _$SchemaOutputTypeToJson(SchemaOutputType instance) =>
    <String, dynamic>{
      'type': instance.type,
      'isList': instance.isList,
      'isRequired': instance.isRequired,
      'kind': _$FieldKindEnumMap[instance.kind]!,
    };

CoreType _$CoreTypeFromJson(Map<String, dynamic> json) => CoreType(
      json['name'] as String,
      json['isWhereType'] as bool?,
      json['isOrderType'] as bool?,
      json['atLeastOne'] as bool?,
      json['atMostOne'] as bool?,
      (json['fields'] as List<dynamic>)
          .map((e) => OuterInputType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoreTypeToJson(CoreType instance) => <String, dynamic>{
      'name': instance.name,
      'isWhereType': instance.isWhereType,
      'isOrderType': instance.isOrderType,
      'atLeastOne': instance.atLeastOne,
      'atMostOne': instance.atMostOne,
      'fields': instance.fields,
    };
