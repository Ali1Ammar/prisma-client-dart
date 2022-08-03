abstract class PrismaEnum {
  String get $name$;
}

enum UserScalarFieldEnum implements PrismaEnum {
  id("id"),
  userName("userName"),
  name("name"),
  password("password"),
  permissons("permissons"),
  resturantId("resturantId");

  @override
  final String $name$;
  const UserScalarFieldEnum(this.$name$);
}

enum ResturantScalarFieldEnum implements PrismaEnum {
  id("id"),
  isDisabled("isDisabled"),
  name("name"),
  img("img"),
  location("location");

  @override
  final String $name$;
  const ResturantScalarFieldEnum(this.$name$);
}

enum KitchenScalarFieldEnum implements PrismaEnum {
  id("id"),
  isDisabled("isDisabled"),
  name("name"),
  resturantId("resturantId");

  @override
  final String $name$;
  const KitchenScalarFieldEnum(this.$name$);
}

enum CustomerSpotScalarFieldEnum implements PrismaEnum {
  id("id"),
  isDisabled("isDisabled"),
  identifier("identifier"),
  resturantId("resturantId"),
  kitchenId("kitchenId"),
  orderTypeId("orderTypeId");

  @override
  final String $name$;
  const CustomerSpotScalarFieldEnum(this.$name$);
}

enum MainCategoryScalarFieldEnum implements PrismaEnum {
  id("id"),
  title("title"),
  desc("desc"),
  img("img"),
  resturantId("resturantId");

  @override
  final String $name$;
  const MainCategoryScalarFieldEnum(this.$name$);
}

enum SubCategoryScalarFieldEnum implements PrismaEnum {
  id("id"),
  title("title"),
  mainCategoryId("mainCategoryId");

  @override
  final String $name$;
  const SubCategoryScalarFieldEnum(this.$name$);
}

enum MealScalarFieldEnum implements PrismaEnum {
  id("id"),
  title("title"),
  desc("desc"),
  img("img"),
  price("price"),
  extra("extra"),
  isDisabled("isDisabled"),
  subCategoryId("subCategoryId"),
  kitchenId("kitchenId");

  @override
  final String $name$;
  const MealScalarFieldEnum(this.$name$);
}

enum OrderItemScalarFieldEnum implements PrismaEnum {
  id("id"),
  count("count"),
  notes("notes"),
  selectedExtra("selectedExtra"),
  mealId("mealId"),
  orderId("orderId");

  @override
  final String $name$;
  const OrderItemScalarFieldEnum(this.$name$);
}

enum OrderTypeScalarFieldEnum implements PrismaEnum {
  id("id"),
  name("name"),
  paymentMsg("paymentMsg"),
  deliverMsg("deliverMsg"),
  paymentType("paymentType"),
  deliverType("deliverType"),
  resturantId("resturantId"),
  selectKitchenVia("selectKitchenVia"),
  selectCustomerSpot("selectCustomerSpot");

  @override
  final String $name$;
  const OrderTypeScalarFieldEnum(this.$name$);
}

enum OrderScalarFieldEnum implements PrismaEnum {
  id("id"),
  kitchenIds("kitchenIds"),
  status("status"),
  customerSpotId("customerSpotId"),
  orderTypeId("orderTypeId"),
  price("price"),
  isPayed("isPayed"),
  resturantId("resturantId");

  @override
  final String $name$;
  const OrderScalarFieldEnum(this.$name$);
}

enum CustomerFeedBackScalarFieldEnum implements PrismaEnum {
  id("id"),
  desc("desc"),
  rate("rate"),
  type("type"),
  orderId("orderId"),
  resturantId("resturantId");

  @override
  final String $name$;
  const CustomerFeedBackScalarFieldEnum(this.$name$);
}

enum CacheEntityScalarFieldEnum implements PrismaEnum {
  key("key"),
  value("value");

  @override
  final String $name$;
  const CacheEntityScalarFieldEnum(this.$name$);
}

enum CategoryScalarFieldEnum implements PrismaEnum {
  updatedAt("updatedAt"),
  name("name"),
  material("material");

  @override
  final String $name$;
  const CategoryScalarFieldEnum(this.$name$);
}

enum FileItemScalarFieldEnum implements PrismaEnum {
  id("id"),
  title("title"),
  desc("desc"),
  url("url"),
  category("category"),
  teacherId("teacherId"),
  branch("branch"),
  material("material"),
  classe("classe"),
  updatedAt("updatedAt"),
  topicId("topicId");

  @override
  final String $name$;
  const FileItemScalarFieldEnum(this.$name$);
}

enum NoteBookScalarFieldEnum implements PrismaEnum {
  id("id"),
  title("title"),
  material("material"),
  category("category");

  @override
  final String $name$;
  const NoteBookScalarFieldEnum(this.$name$);
}

enum NoteBookItemScalarFieldEnum implements PrismaEnum {
  id("id"),
  textBlob("text_blob"),
  drawImgBlob("draw_img_blob"),
  drawVectorBlob("draw_vector_blob"),
  image("image"),
  textAlignIndex("text_align_index"),
  updatedAt("updated_at"),
  noteBookId("note_book_id"),
  version("version");

  @override
  final String $name$;
  const NoteBookItemScalarFieldEnum(this.$name$);
}

enum PlaylistScalarFieldEnum implements PrismaEnum {
  id("id"),
  name("name"),
  url("url"),
  teacherId("teacherId"),
  branch("branch"),
  updatedAt("updatedAt"),
  imageurl("imageurl"),
  topicId("topicId");

  @override
  final String $name$;
  const PlaylistScalarFieldEnum(this.$name$);
}

enum QaScalarFieldEnum implements PrismaEnum {
  id("id"),
  qaType("qaType"),
  question("question"),
  answer("answer"),
  material("material"),
  branch("branch"),
  updatedAt("updatedAt"),
  categoryName("categoryName"),
  hasEquation("hasEquation"),
  topicId("topicId");

  @override
  final String $name$;
  const QaScalarFieldEnum(this.$name$);
}

enum TeacherScalarFieldEnum implements PrismaEnum {
  id("id"),
  name("name"),
  url("url"),
  classe("classe"),
  branch("branch"),
  material("material"),
  updatedAt("updatedAt"),
  detals("detals"),
  score("score");

  @override
  final String $name$;
  const TeacherScalarFieldEnum(this.$name$);
}

enum TopicScalarFieldEnum implements PrismaEnum {
  id("id"),
  order("order"),
  name("name"),
  material("material"),
  branch("branch"),
  classe("classe"),
  parentId("parentId"),
  updatedAt("updatedAt"),
  deletedMode("deletedMode"),
  minScore("minScore"),
  maxScore("maxScore");

  @override
  final String $name$;
  const TopicScalarFieldEnum(this.$name$);
}

enum TrackQaScalarFieldEnum implements PrismaEnum {
  qaId("qa_id"),
  level("level"),
  updatedAt("updated_at");

  @override
  final String $name$;
  const TrackQaScalarFieldEnum(this.$name$);
}

enum TrackUnitScalarFieldEnum implements PrismaEnum {
  topicId("topic_id"),
  inProgressQa("in_progress_qa"),
  completedQa("completed_qa");

  @override
  final String $name$;
  const TrackUnitScalarFieldEnum(this.$name$);
}

enum VideoScalarFieldEnum implements PrismaEnum {
  id("id"),
  name("name"),
  url("url"),
  playListId("playListId"),
  teacherId("teacherId"),
  material("material"),
  branch("branch"),
  updatedAt("updatedAt"),
  categoryName("categoryName");

  @override
  final String $name$;
  const VideoScalarFieldEnum(this.$name$);
}

enum VideoTopicsTopicScalarFieldEnum implements PrismaEnum {
  videoId("videoId"),
  topicId("topicId");

  @override
  final String $name$;
  const VideoTopicsTopicScalarFieldEnum(this.$name$);
}

enum SortOrder implements PrismaEnum {
  asc("asc"),
  desc("desc");

  @override
  final String $name$;
  const SortOrder(this.$name$);
}

enum QueryMode implements PrismaEnum {
  $default("default"),
  insensitive("insensitive");

  @override
  final String $name$;
  const QueryMode(this.$name$);
}

enum SystemEmpType implements PrismaEnum {
  admin("Admin"),
  mangeResturant("MangeResturant"),
  finical("Finical");

  @override
  final String $name$;
  const SystemEmpType(this.$name$);
}

enum PaymentType implements PrismaEnum {
  beforeTakeOrder("beforeTakeOrder"),
  afterTakeOrder("afterTakeOrder");

  @override
  final String $name$;
  const PaymentType(this.$name$);
}

enum DeliverType implements PrismaEnum {
  employeerDeliverFood("employeerDeliverFood"),
  customerPickFood("customerPickFood");

  @override
  final String $name$;
  const DeliverType(this.$name$);
}

enum UserPermissions implements PrismaEnum {
  systemAdmin("SystemAdmin"),
  resturantAdmin("ResturantAdmin"),
  cacher("Cacher"),
  kitchen("Kitchen"),
  waiter("Waiter");

  @override
  final String $name$;
  const UserPermissions(this.$name$);
}

enum OrderStatus implements PrismaEnum {
  waitPayment("WaitPayment"),
  waitInKitchen("WaitInKitchen"),
  doneByKitchen("DoneByKitchen"),
  canceled("Canceled"),
  done("Done");

  @override
  final String $name$;
  const OrderStatus(this.$name$);
}

enum FeedBackType implements PrismaEnum {
  badFood("BadFood"),
  badService("BadService"),
  badTiming("BadTiming");

  @override
  final String $name$;
  const FeedBackType(this.$name$);
}

enum SelectKitchenVia implements PrismaEnum {
  none("None"),
  customerSpot("CustomerSpot"),
  meal("Meal");

  @override
  final String $name$;
  const SelectKitchenVia(this.$name$);
}
