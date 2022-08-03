// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as int,
      json['userName'] as String,
      json['name'] as String,
      json['password'] as String,
      (json['permissons'] as List<dynamic>)
          .map((e) => $enumDecode(_$UserPermissionsEnumMap, e))
          .toList(),
      json['Resturant'] == null
          ? null
          : Resturant.fromJson(json['Resturant'] as Map<String, dynamic>),
      json['resturantId'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'name': instance.name,
      'password': instance.password,
      'permissons':
          instance.permissons.map((e) => _$UserPermissionsEnumMap[e]!).toList(),
      'Resturant': instance.resturant?.toJson(),
      'resturantId': instance.resturantId,
    };

const _$UserPermissionsEnumMap = {
  UserPermissions.systemAdmin: 'systemAdmin',
  UserPermissions.resturantAdmin: 'resturantAdmin',
  UserPermissions.cacher: 'cacher',
  UserPermissions.kitchen: 'kitchen',
  UserPermissions.waiter: 'waiter',
};

Resturant _$ResturantFromJson(Map<String, dynamic> json) => Resturant(
      json['id'] as int,
      json['isDisabled'] as bool,
      json['name'] as String,
      json['img'] as String,
      json['location'] as String,
      (json['admins'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['mainCategory'] as List<dynamic>?)
          ?.map((e) => MainCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['customerSpot'] as List<dynamic>?)
          ?.map((e) => CustomerSpot.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['kitchen'] as List<dynamic>?)
          ?.map((e) => Kitchen.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['orderType'] as List<dynamic>?)
          ?.map((e) => OrderType.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['CustomerFeedBack'] as List<dynamic>?)
          ?.map((e) => CustomerFeedBack.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Order'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResturantToJson(Resturant instance) => <String, dynamic>{
      'id': instance.id,
      'isDisabled': instance.isDisabled,
      'name': instance.name,
      'img': instance.img,
      'location': instance.location,
      'admins': instance.admins?.map((e) => e.toJson()).toList(),
      'mainCategory': instance.mainCategory?.map((e) => e.toJson()).toList(),
      'customerSpot': instance.customerSpot?.map((e) => e.toJson()).toList(),
      'kitchen': instance.kitchen?.map((e) => e.toJson()).toList(),
      'orderType': instance.orderType?.map((e) => e.toJson()).toList(),
      'CustomerFeedBack':
          instance.customerFeedBack?.map((e) => e.toJson()).toList(),
      'Order': instance.order?.map((e) => e.toJson()).toList(),
    };

Kitchen _$KitchenFromJson(Map<String, dynamic> json) => Kitchen(
      json['id'] as int,
      json['isDisabled'] as bool,
      json['resturatn'] == null
          ? null
          : Resturant.fromJson(json['resturatn'] as Map<String, dynamic>),
      json['name'] as String,
      (json['customerSpot'] as List<dynamic>?)
          ?.map((e) => CustomerSpot.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['meal'] as List<dynamic>?)
          ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['resturantId'] as int,
      (json['orderType'] as List<dynamic>?)
          ?.map((e) => OrderType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KitchenToJson(Kitchen instance) => <String, dynamic>{
      'id': instance.id,
      'isDisabled': instance.isDisabled,
      'resturatn': instance.resturatn?.toJson(),
      'name': instance.name,
      'customerSpot': instance.customerSpot?.map((e) => e.toJson()).toList(),
      'meal': instance.meal?.map((e) => e.toJson()).toList(),
      'resturantId': instance.resturantId,
      'orderType': instance.orderType?.map((e) => e.toJson()).toList(),
    };

CustomerSpot _$CustomerSpotFromJson(Map<String, dynamic> json) => CustomerSpot(
      json['id'] as int,
      json['isDisabled'] as bool,
      json['identifier'] as String,
      json['resturant'] == null
          ? null
          : Resturant.fromJson(json['resturant'] as Map<String, dynamic>),
      (json['order'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['resturantId'] as int,
      json['kitchen'] == null
          ? null
          : Kitchen.fromJson(json['kitchen'] as Map<String, dynamic>),
      json['kitchenId'] as int?,
      json['orderType'] == null
          ? null
          : OrderType.fromJson(json['orderType'] as Map<String, dynamic>),
      json['orderTypeId'] as int,
    );

Map<String, dynamic> _$CustomerSpotToJson(CustomerSpot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isDisabled': instance.isDisabled,
      'identifier': instance.identifier,
      'resturant': instance.resturant?.toJson(),
      'order': instance.order?.map((e) => e.toJson()).toList(),
      'resturantId': instance.resturantId,
      'kitchen': instance.kitchen?.toJson(),
      'kitchenId': instance.kitchenId,
      'orderType': instance.orderType?.toJson(),
      'orderTypeId': instance.orderTypeId,
    };

MainCategory _$MainCategoryFromJson(Map<String, dynamic> json) => MainCategory(
      json['id'] as int,
      json['title'] as String,
      json['desc'] as String,
      json['img'] as String,
      json['resturant'] == null
          ? null
          : Resturant.fromJson(json['resturant'] as Map<String, dynamic>),
      (json['children'] as List<dynamic>?)
          ?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['resturantId'] as int,
    );

Map<String, dynamic> _$MainCategoryToJson(MainCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'img': instance.img,
      'resturant': instance.resturant?.toJson(),
      'children': instance.children?.map((e) => e.toJson()).toList(),
      'resturantId': instance.resturantId,
    };

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => SubCategory(
      json['id'] as int,
      json['title'] as String,
      json['mainCategoryId'] as int,
      json['mainCategory'] == null
          ? null
          : MainCategory.fromJson(json['mainCategory'] as Map<String, dynamic>),
      (json['meals'] as List<dynamic>?)
          ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mainCategoryId': instance.mainCategoryId,
      'mainCategory': instance.mainCategory?.toJson(),
      'meals': instance.meals?.map((e) => e.toJson()).toList(),
    };

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      json['id'] as int,
      json['title'] as String,
      json['desc'] as String,
      json['img'] as String?,
      (json['price'] as num).toDouble(),
      (json['extra'] as List<dynamic>).map((e) => e as String).toList(),
      json['isDisabled'] as bool,
      json['subCategory'] == null
          ? null
          : SubCategory.fromJson(json['subCategory'] as Map<String, dynamic>),
      json['subCategoryId'] as int,
      (json['orderItem'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['kitchen'] == null
          ? null
          : Kitchen.fromJson(json['kitchen'] as Map<String, dynamic>),
      json['kitchenId'] as int?,
    );

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'img': instance.img,
      'price': instance.price,
      'extra': instance.extra,
      'isDisabled': instance.isDisabled,
      'subCategory': instance.subCategory?.toJson(),
      'subCategoryId': instance.subCategoryId,
      'orderItem': instance.orderItem?.map((e) => e.toJson()).toList(),
      'kitchen': instance.kitchen?.toJson(),
      'kitchenId': instance.kitchenId,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      json['id'] as int,
      json['meal'] == null
          ? null
          : Meal.fromJson(json['meal'] as Map<String, dynamic>),
      json['count'] as int,
      json['notes'] as String?,
      (json['selectedExtra'] as List<dynamic>).map((e) => e as String).toList(),
      json['mealId'] as int,
      json['Order'] == null
          ? null
          : Order.fromJson(json['Order'] as Map<String, dynamic>),
      json['orderId'] as int,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'id': instance.id,
      'meal': instance.meal?.toJson(),
      'count': instance.count,
      'notes': instance.notes,
      'selectedExtra': instance.selectedExtra,
      'mealId': instance.mealId,
      'Order': instance.order?.toJson(),
      'orderId': instance.orderId,
    };

OrderType _$OrderTypeFromJson(Map<String, dynamic> json) => OrderType(
      json['id'] as int,
      json['name'] as String,
      json['paymentMsg'] as String,
      json['deliverMsg'] as String,
      $enumDecode(_$PaymentTypeEnumMap, json['paymentType']),
      $enumDecode(_$DeliverTypeEnumMap, json['deliverType']),
      json['resturant'] == null
          ? null
          : Resturant.fromJson(json['resturant'] as Map<String, dynamic>),
      json['resturantId'] as int,
      $enumDecode(_$SelectKitchenViaEnumMap, json['selectKitchenVia']),
      json['selectCustomerSpot'] as bool,
      (json['order'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['customerSpot'] as List<dynamic>?)
          ?.map((e) => CustomerSpot.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['kitchen'] as List<dynamic>?)
          ?.map((e) => Kitchen.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderTypeToJson(OrderType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'paymentMsg': instance.paymentMsg,
      'deliverMsg': instance.deliverMsg,
      'paymentType': _$PaymentTypeEnumMap[instance.paymentType]!,
      'deliverType': _$DeliverTypeEnumMap[instance.deliverType]!,
      'resturant': instance.resturant?.toJson(),
      'resturantId': instance.resturantId,
      'selectKitchenVia': _$SelectKitchenViaEnumMap[instance.selectKitchenVia]!,
      'selectCustomerSpot': instance.selectCustomerSpot,
      'order': instance.order?.map((e) => e.toJson()).toList(),
      'customerSpot': instance.customerSpot?.map((e) => e.toJson()).toList(),
      'kitchen': instance.kitchen?.map((e) => e.toJson()).toList(),
    };

const _$PaymentTypeEnumMap = {
  PaymentType.beforeTakeOrder: 'beforeTakeOrder',
  PaymentType.afterTakeOrder: 'afterTakeOrder',
};

const _$DeliverTypeEnumMap = {
  DeliverType.employeerDeliverFood: 'employeerDeliverFood',
  DeliverType.customerPickFood: 'customerPickFood',
};

const _$SelectKitchenViaEnumMap = {
  SelectKitchenVia.none: 'none',
  SelectKitchenVia.customerSpot: 'customerSpot',
  SelectKitchenVia.meal: 'meal',
};

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      json['id'] as int,
      (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['kitchenIds'] as List<dynamic>).map((e) => e as int).toList(),
      $enumDecode(_$OrderStatusEnumMap, json['status']),
      json['customerSpot'] == null
          ? null
          : CustomerSpot.fromJson(json['customerSpot'] as Map<String, dynamic>),
      json['customerSpotId'] as int?,
      json['customerFeedBack'] == null
          ? null
          : CustomerFeedBack.fromJson(
              json['customerFeedBack'] as Map<String, dynamic>),
      json['type'] == null
          ? null
          : OrderType.fromJson(json['type'] as Map<String, dynamic>),
      json['orderTypeId'] as int,
      (json['price'] as num).toDouble(),
      json['isPayed'] as bool,
      json['resturant'] == null
          ? null
          : Resturant.fromJson(json['resturant'] as Map<String, dynamic>),
      json['resturantId'] as int,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'orderItems': instance.orderItems?.map((e) => e.toJson()).toList(),
      'kitchenIds': instance.kitchenIds,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'customerSpot': instance.customerSpot?.toJson(),
      'customerSpotId': instance.customerSpotId,
      'customerFeedBack': instance.customerFeedBack?.toJson(),
      'type': instance.type?.toJson(),
      'orderTypeId': instance.orderTypeId,
      'price': instance.price,
      'isPayed': instance.isPayed,
      'resturant': instance.resturant?.toJson(),
      'resturantId': instance.resturantId,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.waitPayment: 'waitPayment',
  OrderStatus.waitInKitchen: 'waitInKitchen',
  OrderStatus.doneByKitchen: 'doneByKitchen',
  OrderStatus.canceled: 'canceled',
  OrderStatus.done: 'done',
};

CustomerFeedBack _$CustomerFeedBackFromJson(Map<String, dynamic> json) =>
    CustomerFeedBack(
      json['id'] as int,
      json['order'] == null
          ? null
          : Order.fromJson(json['order'] as Map<String, dynamic>),
      json['desc'] as String,
      json['rate'] as int,
      (json['type'] as List<dynamic>)
          .map((e) => $enumDecode(_$FeedBackTypeEnumMap, e))
          .toList(),
      json['orderId'] as int,
      json['resturant'] == null
          ? null
          : Resturant.fromJson(json['resturant'] as Map<String, dynamic>),
      json['resturantId'] as int,
    );

Map<String, dynamic> _$CustomerFeedBackToJson(CustomerFeedBack instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order?.toJson(),
      'desc': instance.desc,
      'rate': instance.rate,
      'type': instance.type.map((e) => _$FeedBackTypeEnumMap[e]!).toList(),
      'orderId': instance.orderId,
      'resturant': instance.resturant?.toJson(),
      'resturantId': instance.resturantId,
    };

const _$FeedBackTypeEnumMap = {
  FeedBackType.badFood: 'badFood',
  FeedBackType.badService: 'badService',
  FeedBackType.badTiming: 'badTiming',
};

CacheEntity _$CacheEntityFromJson(Map<String, dynamic> json) => CacheEntity(
      json['key'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$CacheEntityToJson(CacheEntity instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      DateTime.parse(json['updatedAt'] as String),
      json['name'] as String,
      json['material'] as String,
      (json['qa'] as List<dynamic>?)
          ?.map((e) => Qa.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['video'] as List<dynamic>?)
          ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'updatedAt': instance.updatedAt.toIso8601String(),
      'name': instance.name,
      'material': instance.material,
      'qa': instance.qa?.map((e) => e.toJson()).toList(),
      'video': instance.video?.map((e) => e.toJson()).toList(),
    };

FileItem _$FileItemFromJson(Map<String, dynamic> json) => FileItem(
      json['id'] as int,
      json['title'] as String,
      json['desc'] as String?,
      json['url'] as String,
      json['category'] as String,
      json['teacherId'] as int?,
      json['branch'] as String,
      json['material'] as String,
      json['classe'] as int,
      DateTime.parse(json['updatedAt'] as String),
      json['topicId'] as int?,
      json['teacher'] == null
          ? null
          : Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
      json['topic'] == null
          ? null
          : Topic.fromJson(json['topic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FileItemToJson(FileItem instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'url': instance.url,
      'category': instance.category,
      'teacherId': instance.teacherId,
      'branch': instance.branch,
      'material': instance.material,
      'classe': instance.classe,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'topicId': instance.topicId,
      'teacher': instance.teacher?.toJson(),
      'topic': instance.topic?.toJson(),
    };

NoteBook _$NoteBookFromJson(Map<String, dynamic> json) => NoteBook(
      json['id'] as int,
      json['title'] as String,
      json['material'] as String?,
      json['category'] as String?,
      (json['note_book_item'] as List<dynamic>?)
          ?.map((e) => NoteBookItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NoteBookToJson(NoteBook instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'material': instance.material,
      'category': instance.category,
      'note_book_item': instance.noteBookItem?.map((e) => e.toJson()).toList(),
    };

NoteBookItem _$NoteBookItemFromJson(Map<String, dynamic> json) => NoteBookItem(
      json['id'] as int,
      json['text_blob'],
      json['draw_img_blob'],
      json['draw_vector_blob'],
      json['image'] as String?,
      json['text_align_index'] as int,
      json['updated_at'] as int,
      json['note_book_id'] as int,
      json['version'] as int,
      json['note_book'] == null
          ? null
          : NoteBook.fromJson(json['note_book'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NoteBookItemToJson(NoteBookItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text_blob': instance.textBlob,
      'draw_img_blob': instance.drawImgBlob,
      'draw_vector_blob': instance.drawVectorBlob,
      'image': instance.image,
      'text_align_index': instance.textAlignIndex,
      'updated_at': instance.updatedAt,
      'note_book_id': instance.noteBookId,
      'version': instance.version,
      'note_book': instance.noteBook?.toJson(),
    };

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      json['id'] as int,
      json['name'] as String,
      json['url'] as String,
      json['teacherId'] as int,
      json['branch'] as String,
      DateTime.parse(json['updatedAt'] as String),
      json['imageurl'] as String,
      json['topicId'] as int,
      json['topic'] == null
          ? null
          : Topic.fromJson(json['topic'] as Map<String, dynamic>),
      json['teacher'] == null
          ? null
          : Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'teacherId': instance.teacherId,
      'branch': instance.branch,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'imageurl': instance.imageurl,
      'topicId': instance.topicId,
      'topic': instance.topic?.toJson(),
      'teacher': instance.teacher?.toJson(),
    };

Qa _$QaFromJson(Map<String, dynamic> json) => Qa(
      json['id'] as int,
      json['qaType'] as String,
      json['question'] as String,
      json['answer'] as String?,
      json['material'] as String,
      json['branch'] as String,
      DateTime.parse(json['updatedAt'] as String),
      json['categoryName'] as String?,
      json['hasEquation'] as bool,
      json['topicId'] as int?,
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      json['topic'] == null
          ? null
          : Topic.fromJson(json['topic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QaToJson(Qa instance) => <String, dynamic>{
      'id': instance.id,
      'qaType': instance.qaType,
      'question': instance.question,
      'answer': instance.answer,
      'material': instance.material,
      'branch': instance.branch,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'categoryName': instance.categoryName,
      'hasEquation': instance.hasEquation,
      'topicId': instance.topicId,
      'category': instance.category?.toJson(),
      'topic': instance.topic?.toJson(),
    };

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      json['id'] as int,
      json['name'] as String,
      json['url'] as String?,
      json['classe'] as String,
      json['branch'] as String,
      json['material'] as String,
      DateTime.parse(json['updatedAt'] as String),
      json['detals'] as String?,
      json['score'] as int?,
      (json['file_item'] as List<dynamic>?)
          ?.map((e) => FileItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['playlist'] as List<dynamic>?)
          ?.map((e) => Playlist.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['video'] as List<dynamic>?)
          ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'classe': instance.classe,
      'branch': instance.branch,
      'material': instance.material,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'detals': instance.detals,
      'score': instance.score,
      'file_item': instance.fileItem?.map((e) => e.toJson()).toList(),
      'playlist': instance.playlist?.map((e) => e.toJson()).toList(),
      'video': instance.video?.map((e) => e.toJson()).toList(),
    };

Topic _$TopicFromJson(Map<String, dynamic> json) => Topic(
      json['id'] as int,
      json['order'] as int?,
      json['name'] as String,
      json['material'] as String,
      json['branch'] as String,
      json['classe'] as int,
      json['parentId'] as int?,
      DateTime.parse(json['updatedAt'] as String),
      json['deletedMode'] as String?,
      json['minScore'] as int?,
      json['maxScore'] as int?,
      json['topic'] == null
          ? null
          : Topic.fromJson(json['topic'] as Map<String, dynamic>),
      (json['file_item'] as List<dynamic>?)
          ?.map((e) => FileItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['playlist'] as List<dynamic>?)
          ?.map((e) => Playlist.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['qa'] as List<dynamic>?)
          ?.map((e) => Qa.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['other_topic'] as List<dynamic>?)
          ?.map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['video_topics_topic'] as List<dynamic>?)
          ?.map((e) => VideoTopicsTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'name': instance.name,
      'material': instance.material,
      'branch': instance.branch,
      'classe': instance.classe,
      'parentId': instance.parentId,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedMode': instance.deletedMode,
      'minScore': instance.minScore,
      'maxScore': instance.maxScore,
      'topic': instance.topic?.toJson(),
      'file_item': instance.fileItem?.map((e) => e.toJson()).toList(),
      'playlist': instance.playlist?.map((e) => e.toJson()).toList(),
      'qa': instance.qa?.map((e) => e.toJson()).toList(),
      'other_topic': instance.otherTopic?.map((e) => e.toJson()).toList(),
      'video_topics_topic':
          instance.videoTopicsTopic?.map((e) => e.toJson()).toList(),
    };

TrackQa _$TrackQaFromJson(Map<String, dynamic> json) => TrackQa(
      json['qa_id'] as int,
      json['level'] as int,
      json['updated_at'] as int,
    );

Map<String, dynamic> _$TrackQaToJson(TrackQa instance) => <String, dynamic>{
      'qa_id': instance.qaId,
      'level': instance.level,
      'updated_at': instance.updatedAt,
    };

TrackUnit _$TrackUnitFromJson(Map<String, dynamic> json) => TrackUnit(
      json['topic_id'] as int,
      (json['in_progress_qa'] as num).toDouble(),
      (json['completed_qa'] as num).toDouble(),
    );

Map<String, dynamic> _$TrackUnitToJson(TrackUnit instance) => <String, dynamic>{
      'topic_id': instance.topicId,
      'in_progress_qa': instance.inProgressQa,
      'completed_qa': instance.completedQa,
    };

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      json['id'] as int,
      json['name'] as String,
      json['url'] as String,
      json['playListId'] as String?,
      json['teacherId'] as int,
      json['material'] as String,
      json['branch'] as String,
      DateTime.parse(json['updatedAt'] as String),
      json['categoryName'] as String?,
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      json['teacher'] == null
          ? null
          : Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
      (json['video_topics_topic'] as List<dynamic>?)
          ?.map((e) => VideoTopicsTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'playListId': instance.playListId,
      'teacherId': instance.teacherId,
      'material': instance.material,
      'branch': instance.branch,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'categoryName': instance.categoryName,
      'category': instance.category?.toJson(),
      'teacher': instance.teacher?.toJson(),
      'video_topics_topic':
          instance.videoTopicsTopic?.map((e) => e.toJson()).toList(),
    };

VideoTopicsTopic _$VideoTopicsTopicFromJson(Map<String, dynamic> json) =>
    VideoTopicsTopic(
      json['videoId'] as int,
      json['topicId'] as int,
      json['topic'] == null
          ? null
          : Topic.fromJson(json['topic'] as Map<String, dynamic>),
      json['video'] == null
          ? null
          : Video.fromJson(json['video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoTopicsTopicToJson(VideoTopicsTopic instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'topicId': instance.topicId,
      'topic': instance.topic?.toJson(),
      'video': instance.video?.toJson(),
    };
