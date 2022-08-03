import 'package:json_annotation/json_annotation.dart';
import 'enum.dart';
part 'models.g.dart';

@JsonSerializable()
class User {
  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  User(this.id, this.userName, this.name, this.password, this.permissons,
      this.resturant, this.resturantId);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "userName")
  final String userName;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "password")
  final String password;

  @JsonKey(name: "permissons")
  final List<UserPermissions> permissons;

  @JsonKey(name: "Resturant")
  final Resturant? resturant;

  @JsonKey(name: "resturantId")
  final int? resturantId;

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}

@JsonSerializable()
class Resturant {
  factory Resturant.fromJson(Map<String, dynamic> json) {
    return _$ResturantFromJson(json);
  }

  Resturant(
      this.id,
      this.isDisabled,
      this.name,
      this.img,
      this.location,
      this.admins,
      this.mainCategory,
      this.customerSpot,
      this.kitchen,
      this.orderType,
      this.customerFeedBack,
      this.order);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "isDisabled")
  final bool isDisabled;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "img")
  final String img;

  @JsonKey(name: "location")
  final String location;

  @JsonKey(name: "admins")
  final List<User>? admins;

  @JsonKey(name: "mainCategory")
  final List<MainCategory>? mainCategory;

  @JsonKey(name: "customerSpot")
  final List<CustomerSpot>? customerSpot;

  @JsonKey(name: "kitchen")
  final List<Kitchen>? kitchen;

  @JsonKey(name: "orderType")
  final List<OrderType>? orderType;

  @JsonKey(name: "CustomerFeedBack")
  final List<CustomerFeedBack>? customerFeedBack;

  @JsonKey(name: "Order")
  final List<Order>? order;

  Map<String, dynamic> toJson() {
    return _$ResturantToJson(this);
  }
}

@JsonSerializable()
class Kitchen {
  factory Kitchen.fromJson(Map<String, dynamic> json) {
    return _$KitchenFromJson(json);
  }

  Kitchen(this.id, this.isDisabled, this.resturatn, this.name,
      this.customerSpot, this.meal, this.resturantId, this.orderType);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "isDisabled")
  final bool isDisabled;

  @JsonKey(name: "resturatn")
  final Resturant? resturatn;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "customerSpot")
  final List<CustomerSpot>? customerSpot;

  @JsonKey(name: "meal")
  final List<Meal>? meal;

  @JsonKey(name: "resturantId")
  final int resturantId;

  @JsonKey(name: "orderType")
  final List<OrderType>? orderType;

  Map<String, dynamic> toJson() {
    return _$KitchenToJson(this);
  }
}

@JsonSerializable()
class CustomerSpot {
  factory CustomerSpot.fromJson(Map<String, dynamic> json) {
    return _$CustomerSpotFromJson(json);
  }

  CustomerSpot(
      this.id,
      this.isDisabled,
      this.identifier,
      this.resturant,
      this.order,
      this.resturantId,
      this.kitchen,
      this.kitchenId,
      this.orderType,
      this.orderTypeId);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "isDisabled")
  final bool isDisabled;

  @JsonKey(name: "identifier")
  final String identifier;

  @JsonKey(name: "resturant")
  final Resturant? resturant;

  @JsonKey(name: "order")
  final List<Order>? order;

  @JsonKey(name: "resturantId")
  final int resturantId;

  @JsonKey(name: "kitchen")
  final Kitchen? kitchen;

  @JsonKey(name: "kitchenId")
  final int? kitchenId;

  @JsonKey(name: "orderType")
  final OrderType? orderType;

  @JsonKey(name: "orderTypeId")
  final int orderTypeId;

  Map<String, dynamic> toJson() {
    return _$CustomerSpotToJson(this);
  }
}

@JsonSerializable()
class MainCategory {
  factory MainCategory.fromJson(Map<String, dynamic> json) {
    return _$MainCategoryFromJson(json);
  }

  MainCategory(this.id, this.title, this.desc, this.img, this.resturant,
      this.children, this.resturantId);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "desc")
  final String desc;

  @JsonKey(name: "img")
  final String img;

  @JsonKey(name: "resturant")
  final Resturant? resturant;

  @JsonKey(name: "children")
  final List<SubCategory>? children;

  @JsonKey(name: "resturantId")
  final int resturantId;

  Map<String, dynamic> toJson() {
    return _$MainCategoryToJson(this);
  }
}

@JsonSerializable()
class SubCategory {
  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return _$SubCategoryFromJson(json);
  }

  SubCategory(
      this.id, this.title, this.mainCategoryId, this.mainCategory, this.meals);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "mainCategoryId")
  final int mainCategoryId;

  @JsonKey(name: "mainCategory")
  final MainCategory? mainCategory;

  @JsonKey(name: "meals")
  final List<Meal>? meals;

  Map<String, dynamic> toJson() {
    return _$SubCategoryToJson(this);
  }
}

@JsonSerializable()
class Meal {
  factory Meal.fromJson(Map<String, dynamic> json) {
    return _$MealFromJson(json);
  }

  Meal(
      this.id,
      this.title,
      this.desc,
      this.img,
      this.price,
      this.extra,
      this.isDisabled,
      this.subCategory,
      this.subCategoryId,
      this.orderItem,
      this.kitchen,
      this.kitchenId);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "desc")
  final String desc;

  @JsonKey(name: "img")
  final String? img;

  @JsonKey(name: "price")
  final double price;

  @JsonKey(name: "extra")
  final List<String> extra;

  @JsonKey(name: "isDisabled")
  final bool isDisabled;

  @JsonKey(name: "subCategory")
  final SubCategory? subCategory;

  @JsonKey(name: "subCategoryId")
  final int subCategoryId;

  @JsonKey(name: "orderItem")
  final List<OrderItem>? orderItem;

  @JsonKey(name: "kitchen")
  final Kitchen? kitchen;

  @JsonKey(name: "kitchenId")
  final int? kitchenId;

  Map<String, dynamic> toJson() {
    return _$MealToJson(this);
  }
}

@JsonSerializable()
class OrderItem {
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return _$OrderItemFromJson(json);
  }

  OrderItem(this.id, this.meal, this.count, this.notes, this.selectedExtra,
      this.mealId, this.order, this.orderId);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "meal")
  final Meal? meal;

  @JsonKey(name: "count")
  final int count;

  @JsonKey(name: "notes")
  final String? notes;

  @JsonKey(name: "selectedExtra")
  final List<String> selectedExtra;

  @JsonKey(name: "mealId")
  final int mealId;

  @JsonKey(name: "Order")
  final Order? order;

  @JsonKey(name: "orderId")
  final int orderId;

  Map<String, dynamic> toJson() {
    return _$OrderItemToJson(this);
  }
}

@JsonSerializable()
class OrderType {
  factory OrderType.fromJson(Map<String, dynamic> json) {
    return _$OrderTypeFromJson(json);
  }

  OrderType(
      this.id,
      this.name,
      this.paymentMsg,
      this.deliverMsg,
      this.paymentType,
      this.deliverType,
      this.resturant,
      this.resturantId,
      this.selectKitchenVia,
      this.selectCustomerSpot,
      this.order,
      this.customerSpot,
      this.kitchen);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "paymentMsg")
  final String paymentMsg;

  @JsonKey(name: "deliverMsg")
  final String deliverMsg;

  @JsonKey(name: "paymentType")
  final PaymentType paymentType;

  @JsonKey(name: "deliverType")
  final DeliverType deliverType;

  @JsonKey(name: "resturant")
  final Resturant? resturant;

  @JsonKey(name: "resturantId")
  final int resturantId;

  @JsonKey(name: "selectKitchenVia")
  final SelectKitchenVia selectKitchenVia;

  @JsonKey(name: "selectCustomerSpot")
  final bool selectCustomerSpot;

  @JsonKey(name: "order")
  final List<Order>? order;

  @JsonKey(name: "customerSpot")
  final List<CustomerSpot>? customerSpot;

  @JsonKey(name: "kitchen")
  final List<Kitchen>? kitchen;

  Map<String, dynamic> toJson() {
    return _$OrderTypeToJson(this);
  }
}

@JsonSerializable()
class Order {
  factory Order.fromJson(Map<String, dynamic> json) {
    return _$OrderFromJson(json);
  }

  Order(
      this.id,
      this.orderItems,
      this.kitchenIds,
      this.status,
      this.customerSpot,
      this.customerSpotId,
      this.customerFeedBack,
      this.type,
      this.orderTypeId,
      this.price,
      this.isPayed,
      this.resturant,
      this.resturantId);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "orderItems")
  final List<OrderItem>? orderItems;

  @JsonKey(name: "kitchenIds")
  final List<int> kitchenIds;

  @JsonKey(name: "status")
  final OrderStatus status;

  @JsonKey(name: "customerSpot")
  final CustomerSpot? customerSpot;

  @JsonKey(name: "customerSpotId")
  final int? customerSpotId;

  @JsonKey(name: "customerFeedBack")
  final CustomerFeedBack? customerFeedBack;

  @JsonKey(name: "type")
  final OrderType? type;

  @JsonKey(name: "orderTypeId")
  final int orderTypeId;

  @JsonKey(name: "price")
  final double price;

  @JsonKey(name: "isPayed")
  final bool isPayed;

  @JsonKey(name: "resturant")
  final Resturant? resturant;

  @JsonKey(name: "resturantId")
  final int resturantId;

  Map<String, dynamic> toJson() {
    return _$OrderToJson(this);
  }
}

@JsonSerializable()
class CustomerFeedBack {
  factory CustomerFeedBack.fromJson(Map<String, dynamic> json) {
    return _$CustomerFeedBackFromJson(json);
  }

  CustomerFeedBack(this.id, this.order, this.desc, this.rate, this.type,
      this.orderId, this.resturant, this.resturantId);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "order")
  final Order? order;

  @JsonKey(name: "desc")
  final String desc;

  @JsonKey(name: "rate")
  final int rate;

  @JsonKey(name: "type")
  final List<FeedBackType> type;

  @JsonKey(name: "orderId")
  final int orderId;

  @JsonKey(name: "resturant")
  final Resturant? resturant;

  @JsonKey(name: "resturantId")
  final int resturantId;

  Map<String, dynamic> toJson() {
    return _$CustomerFeedBackToJson(this);
  }
}

@JsonSerializable()
class CacheEntity {
  factory CacheEntity.fromJson(Map<String, dynamic> json) {
    return _$CacheEntityFromJson(json);
  }

  CacheEntity(this.key, this.value);

  @JsonKey(name: "key")
  final String key;

  @JsonKey(name: "value")
  final String value;

  Map<String, dynamic> toJson() {
    return _$CacheEntityToJson(this);
  }
}

@JsonSerializable()
class Category {
  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Category(this.updatedAt, this.name, this.material, this.qa, this.video);

  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "material")
  final String material;

  @JsonKey(name: "qa")
  final List<Qa>? qa;

  @JsonKey(name: "video")
  final List<Video>? video;

  Map<String, dynamic> toJson() {
    return _$CategoryToJson(this);
  }
}

@JsonSerializable()
class FileItem {
  factory FileItem.fromJson(Map<String, dynamic> json) {
    return _$FileItemFromJson(json);
  }

  FileItem(
      this.id,
      this.title,
      this.desc,
      this.url,
      this.category,
      this.teacherId,
      this.branch,
      this.material,
      this.classe,
      this.updatedAt,
      this.topicId,
      this.teacher,
      this.topic);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "desc")
  final String? desc;

  @JsonKey(name: "url")
  final String url;

  @JsonKey(name: "category")
  final String category;

  @JsonKey(name: "teacherId")
  final int? teacherId;

  @JsonKey(name: "branch")
  final String branch;

  @JsonKey(name: "material")
  final String material;

  @JsonKey(name: "classe")
  final int classe;

  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;

  @JsonKey(name: "topicId")
  final int? topicId;

  @JsonKey(name: "teacher")
  final Teacher? teacher;

  @JsonKey(name: "topic")
  final Topic? topic;

  Map<String, dynamic> toJson() {
    return _$FileItemToJson(this);
  }
}

@JsonSerializable()
class NoteBook {
  factory NoteBook.fromJson(Map<String, dynamic> json) {
    return _$NoteBookFromJson(json);
  }

  NoteBook(
      this.id, this.title, this.material, this.category, this.noteBookItem);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "material")
  final String? material;

  @JsonKey(name: "category")
  final String? category;

  @JsonKey(name: "note_book_item")
  final List<NoteBookItem>? noteBookItem;

  Map<String, dynamic> toJson() {
    return _$NoteBookToJson(this);
  }
}

@JsonSerializable()
class NoteBookItem {
  factory NoteBookItem.fromJson(Map<String, dynamic> json) {
    return _$NoteBookItemFromJson(json);
  }

  NoteBookItem(
      this.id,
      this.textBlob,
      this.drawImgBlob,
      this.drawVectorBlob,
      this.image,
      this.textAlignIndex,
      this.updatedAt,
      this.noteBookId,
      this.version,
      this.noteBook);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "text_blob")
  final dynamic? textBlob;

  @JsonKey(name: "draw_img_blob")
  final dynamic? drawImgBlob;

  @JsonKey(name: "draw_vector_blob")
  final dynamic? drawVectorBlob;

  @JsonKey(name: "image")
  final String? image;

  @JsonKey(name: "text_align_index")
  final int textAlignIndex;

  @JsonKey(name: "updated_at")
  final int updatedAt;

  @JsonKey(name: "note_book_id")
  final int noteBookId;

  @JsonKey(name: "version")
  final int version;

  @JsonKey(name: "note_book")
  final NoteBook? noteBook;

  Map<String, dynamic> toJson() {
    return _$NoteBookItemToJson(this);
  }
}

@JsonSerializable()
class Playlist {
  factory Playlist.fromJson(Map<String, dynamic> json) {
    return _$PlaylistFromJson(json);
  }

  Playlist(this.id, this.name, this.url, this.teacherId, this.branch,
      this.updatedAt, this.imageurl, this.topicId, this.topic, this.teacher);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "url")
  final String url;

  @JsonKey(name: "teacherId")
  final int teacherId;

  @JsonKey(name: "branch")
  final String branch;

  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;

  @JsonKey(name: "imageurl")
  final String imageurl;

  @JsonKey(name: "topicId")
  final int topicId;

  @JsonKey(name: "topic")
  final Topic? topic;

  @JsonKey(name: "teacher")
  final Teacher? teacher;

  Map<String, dynamic> toJson() {
    return _$PlaylistToJson(this);
  }
}

@JsonSerializable()
class Qa {
  factory Qa.fromJson(Map<String, dynamic> json) {
    return _$QaFromJson(json);
  }

  Qa(
      this.id,
      this.qaType,
      this.question,
      this.answer,
      this.material,
      this.branch,
      this.updatedAt,
      this.categoryName,
      this.hasEquation,
      this.topicId,
      this.category,
      this.topic);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "qaType")
  final String qaType;

  @JsonKey(name: "question")
  final String question;

  @JsonKey(name: "answer")
  final String? answer;

  @JsonKey(name: "material")
  final String material;

  @JsonKey(name: "branch")
  final String branch;

  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;

  @JsonKey(name: "categoryName")
  final String? categoryName;

  @JsonKey(name: "hasEquation")
  final bool hasEquation;

  @JsonKey(name: "topicId")
  final int? topicId;

  @JsonKey(name: "category")
  final Category? category;

  @JsonKey(name: "topic")
  final Topic? topic;

  Map<String, dynamic> toJson() {
    return _$QaToJson(this);
  }
}

@JsonSerializable()
class Teacher {
  factory Teacher.fromJson(Map<String, dynamic> json) {
    return _$TeacherFromJson(json);
  }

  Teacher(
      this.id,
      this.name,
      this.url,
      this.classe,
      this.branch,
      this.material,
      this.updatedAt,
      this.detals,
      this.score,
      this.fileItem,
      this.playlist,
      this.video);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "url")
  final String? url;

  @JsonKey(name: "classe")
  final String classe;

  @JsonKey(name: "branch")
  final String branch;

  @JsonKey(name: "material")
  final String material;

  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;

  @JsonKey(name: "detals")
  final String? detals;

  @JsonKey(name: "score")
  final int? score;

  @JsonKey(name: "file_item")
  final List<FileItem>? fileItem;

  @JsonKey(name: "playlist")
  final List<Playlist>? playlist;

  @JsonKey(name: "video")
  final List<Video>? video;

  Map<String, dynamic> toJson() {
    return _$TeacherToJson(this);
  }
}

@JsonSerializable()
class Topic {
  factory Topic.fromJson(Map<String, dynamic> json) {
    return _$TopicFromJson(json);
  }

  Topic(
      this.id,
      this.order,
      this.name,
      this.material,
      this.branch,
      this.classe,
      this.parentId,
      this.updatedAt,
      this.deletedMode,
      this.minScore,
      this.maxScore,
      this.topic,
      this.fileItem,
      this.playlist,
      this.qa,
      this.otherTopic,
      this.videoTopicsTopic);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "order")
  final int? order;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "material")
  final String material;

  @JsonKey(name: "branch")
  final String branch;

  @JsonKey(name: "classe")
  final int classe;

  @JsonKey(name: "parentId")
  final int? parentId;

  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;

  @JsonKey(name: "deletedMode")
  final String? deletedMode;

  @JsonKey(name: "minScore")
  final int? minScore;

  @JsonKey(name: "maxScore")
  final int? maxScore;

  @JsonKey(name: "topic")
  final Topic? topic;

  @JsonKey(name: "file_item")
  final List<FileItem>? fileItem;

  @JsonKey(name: "playlist")
  final List<Playlist>? playlist;

  @JsonKey(name: "qa")
  final List<Qa>? qa;

  @JsonKey(name: "other_topic")
  final List<Topic>? otherTopic;

  @JsonKey(name: "video_topics_topic")
  final List<VideoTopicsTopic>? videoTopicsTopic;

  Map<String, dynamic> toJson() {
    return _$TopicToJson(this);
  }
}

@JsonSerializable()
class TrackQa {
  factory TrackQa.fromJson(Map<String, dynamic> json) {
    return _$TrackQaFromJson(json);
  }

  TrackQa(this.qaId, this.level, this.updatedAt);

  @JsonKey(name: "qa_id")
  final int qaId;

  @JsonKey(name: "level")
  final int level;

  @JsonKey(name: "updated_at")
  final int updatedAt;

  Map<String, dynamic> toJson() {
    return _$TrackQaToJson(this);
  }
}

@JsonSerializable()
class TrackUnit {
  factory TrackUnit.fromJson(Map<String, dynamic> json) {
    return _$TrackUnitFromJson(json);
  }

  TrackUnit(this.topicId, this.inProgressQa, this.completedQa);

  @JsonKey(name: "topic_id")
  final int topicId;

  @JsonKey(name: "in_progress_qa")
  final double inProgressQa;

  @JsonKey(name: "completed_qa")
  final double completedQa;

  Map<String, dynamic> toJson() {
    return _$TrackUnitToJson(this);
  }
}

@JsonSerializable()
class Video {
  factory Video.fromJson(Map<String, dynamic> json) {
    return _$VideoFromJson(json);
  }

  Video(
      this.id,
      this.name,
      this.url,
      this.playListId,
      this.teacherId,
      this.material,
      this.branch,
      this.updatedAt,
      this.categoryName,
      this.category,
      this.teacher,
      this.videoTopicsTopic);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "url")
  final String url;

  @JsonKey(name: "playListId")
  final String? playListId;

  @JsonKey(name: "teacherId")
  final int teacherId;

  @JsonKey(name: "material")
  final String material;

  @JsonKey(name: "branch")
  final String branch;

  @JsonKey(name: "updatedAt")
  final DateTime updatedAt;

  @JsonKey(name: "categoryName")
  final String? categoryName;

  @JsonKey(name: "category")
  final Category? category;

  @JsonKey(name: "teacher")
  final Teacher? teacher;

  @JsonKey(name: "video_topics_topic")
  final List<VideoTopicsTopic>? videoTopicsTopic;

  Map<String, dynamic> toJson() {
    return _$VideoToJson(this);
  }
}

@JsonSerializable()
class VideoTopicsTopic {
  factory VideoTopicsTopic.fromJson(Map<String, dynamic> json) {
    return _$VideoTopicsTopicFromJson(json);
  }

  VideoTopicsTopic(this.videoId, this.topicId, this.topic, this.video);

  @JsonKey(name: "videoId")
  final int videoId;

  @JsonKey(name: "topicId")
  final int topicId;

  @JsonKey(name: "topic")
  final Topic? topic;

  @JsonKey(name: "video")
  final Video? video;

  Map<String, dynamic> toJson() {
    return _$VideoTopicsTopicToJson(this);
  }
}
