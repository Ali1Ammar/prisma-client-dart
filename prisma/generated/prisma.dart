// start of client

import 'package:http/http.dart';
import 'package:prisma_dart/src/engine/query_engine.dart';
import 'package:prisma_dart/src/runtime/lifecycle/lifecycle.dart';
import 'package:prisma_dart/src/runtime/raw/raw.dart';
import 'package:prisma_dart/src/runtime/transaction/transaction.dart';

class PrismaClient {
  PrismaClient.newClient(this.engine, this.action);

  factory PrismaClient() {
    final engine = QueryEngine(
        Client(),
        '''datasource db {
    url = env("DATABASE_URL")

    provider = "postgresql"
}

generator client {
    provider = "dart /home/aliammar/Desktop/dart_build_learn/prisma-client-dart/lib/main.dart"
}

enum SystemEmpType {
  Admin
  MangeResturant
  Finical
}

enum PaymentType {
  beforeTakeOrder
  afterTakeOrder
}

enum DeliverType {
  employeerDeliverFood
  customerPickFood
}

enum UserPermissions {
  SystemAdmin
  ResturantAdmin
  Cacher
  Kitchen
  Waiter
}

model User {
  @@map("Users")
  id          Int               @id @default(autoincrement())
  userName    String            @unique
  name        String
  password    String
  permissons  UserPermissions[]
  Resturant   Resturant?        @relation(fields: [resturantId], references: [id])
  resturantId Int?
}

model Resturant {
  id         Int     @id @default(autoincrement())
  isDisabled Boolean @default(true)
  name         String
  img          String
  location     String
  admins       User[]
  mainCategory MainCategory[]
  customerSpot CustomerSpot[]
  kitchen      Kitchen[]
  orderType    OrderType[]
  CustomerFeedBack CustomerFeedBack[]
  Order            Order[]
}

model Kitchen {
  id         Int     @id @default(autoincrement())
  isDisabled Boolean @default(false)
  resturatn    Resturant      @relation(fields: [resturantId], references: [id])
  name         String
  customerSpot CustomerSpot[]
  meal         Meal[]
  resturantId  Int
  orderType    OrderType[]
}

model CustomerSpot {
  id         Int     @id @default(autoincrement())
  isDisabled Boolean @default(false)
  identifier  String
  resturant   Resturant @relation(fields: [resturantId], references: [id])
  order       Order[]
  resturantId Int
  kitchen     Kitchen?  @relation(fields: [kitchenId], references: [id])
  kitchenId   Int?
  orderType   OrderType @relation(fields: [orderTypeId], references: [id])
  orderTypeId Int
}

model MainCategory {
  id          Int           @id @default(autoincrement())
  title       String
  desc        String
  img         String
  resturant   Resturant     @relation(fields: [resturantId], references: [id])
  children    SubCategory[]
  resturantId Int
}

model SubCategory {
  id             Int          @id @default(autoincrement())
  title          String
  // img            String
  mainCategoryId Int
  mainCategory   MainCategory @relation(fields: [mainCategoryId], references: [id])
  meals          Meal[]
}

model Meal {
  id            Int         @id @default(autoincrement())
  title         String
  desc          String
  img           String?
  price         Float
  extra         String[]
  isDisabled    Boolean     @default(false)
  subCategory   SubCategory @relation(fields: [subCategoryId], references: [id])
  subCategoryId Int
  orderItem     OrderItem[]
  kitchen       Kitchen?    @relation(fields: [kitchenId], references: [id])
  kitchenId     Int?
}

model OrderItem {
  id            Int      @id @default(autoincrement())
  meal          Meal     @relation(fields: [mealId], references: [id])
  count         Int
  notes         String?
  selectedExtra String[]
  mealId        Int
  Order         Order    @relation(fields: [orderId], references: [id])
  orderId       Int
}

model OrderType {
  id                 Int              @id @default(autoincrement())
  name               String
  paymentMsg         String
  deliverMsg         String
  paymentType        PaymentType
  deliverType        DeliverType
  resturant          Resturant        @relation(fields: [resturantId], references: [id])
  resturantId        Int
  selectKitchenVia   SelectKitchenVia
  selectCustomerSpot Boolean
  order              Order[]
  customerSpot       CustomerSpot[]
  kitchen            Kitchen[]
}

model Order {
  id               Int               @id @default(autoincrement())
  orderItems       OrderItem[]
  kitchenIds       Int[]
  status           OrderStatus
  customerSpot     CustomerSpot?     @relation(fields: [customerSpotId], references: [id])
  customerSpotId   Int?
  customerFeedBack CustomerFeedBack?
  type             OrderType         @relation(fields: [orderTypeId], references: [id])
  orderTypeId      Int
  price            Float
  isPayed          Boolean           @default(false)
  resturant   Resturant @relation(fields: [resturantId], references: [id])
  resturantId Int
}

enum OrderStatus {
  WaitPayment
  WaitInKitchen
  DoneByKitchen
  Canceled
  Done
}

model CustomerFeedBack {
  id      Int            @id @default(autoincrement())
  order   Order          @relation(fields: [orderId], references: [id])
  desc    String
  rate    Int
  type    FeedBackType[]
  orderId Int            @unique
  resturant   Resturant @relation(fields: [resturantId], references: [id])
  resturantId Int
}

enum FeedBackType {
  BadFood
  BadService
  BadTiming
}

enum SelectKitchenVia {
  None
  CustomerSpot
  Meal
}

model cache_entity {
  key   String @id
  value String
}

model category {
  updatedAt DateTime @default(now())
  name      String
  material  String
  qa        qa[]
  video     video[]

  @@id([name, material])
}

model file_item {
  id        Int      @id @default(autoincrement())
  title     String
  desc      String?
  url       String
  category  String
  teacherId Int?
  branch    String
  material  String
  classe    Int
  updatedAt DateTime @default(now())
  topicId   Int?
  teacher   teacher? @relation(fields: [teacherId], references: [id], onDelete: NoAction, onUpdate: NoAction)
  topic     topic?   @relation(fields: [topicId], references: [id], onDelete: NoAction, onUpdate: NoAction)
}

model note_book {
  id             Int              @id @default(autoincrement())
  title          String
  material       String?
  category       String?
  note_book_item note_book_item[]
}

model note_book_item {
  id               Int       @id @default(autoincrement())
  text_blob        Bytes?
  draw_img_blob    Bytes?
  draw_vector_blob Bytes?
  image            String?
  text_align_index Int
  updated_at       Int
  note_book_id     Int
  version          Int       @default(0)
  note_book        note_book @relation(fields: [note_book_id], references: [id], onDelete: NoAction, onUpdate: NoAction)
}

model playlist {
  id        Int      @id @default(autoincrement())
  name      String
  url       String
  teacherId Int
  branch    String
  updatedAt DateTime @default(now())
  imageurl  String
  topicId   Int
  topic     topic    @relation(fields: [topicId], references: [id], onDelete: NoAction, onUpdate: NoAction)
  teacher   teacher  @relation(fields: [teacherId], references: [id], onDelete: NoAction, onUpdate: NoAction)
}

model qa {
  id           Int       @id @default(autoincrement())
  qaType       String
  question     String
  answer       String?
  material     String
  branch       String
  updatedAt    DateTime  @default(now())
  categoryName String?
  hasEquation  Boolean   @default(false)
  topicId      Int?
  category     category? @relation(fields: [categoryName, material], references: [name, material], onDelete: NoAction, onUpdate: NoAction)
  topic        topic?    @relation(fields: [topicId], references: [id], onDelete: NoAction, onUpdate: NoAction)
}

model teacher {
  id        Int         @id @default(autoincrement())
  name      String
  url       String?     @unique(map: "sqlite_autoindex_teacher_1")
  classe    String
  branch    String      @default("general")
  material  String
  updatedAt DateTime    @default(now())
  detals    String?
  score     Int?
  file_item file_item[]
  playlist  playlist[]
  video     video[]
}

model topic {
  id                 Int                  @id @default(autoincrement())
  order              Int?
  name               String
  material           String
  branch             String
  classe             Int
  parentId           Int?
  updatedAt          DateTime             @default(now())
  deletedMode        String?
  minScore           Int?
  maxScore           Int?
  topic              topic?               @relation("topicTotopic", fields: [parentId], references: [id], onDelete: NoAction, onUpdate: NoAction)
  file_item          file_item[]
  playlist           playlist[]
  qa                 qa[]
  other_topic        topic[]              @relation("topicTotopic")
  video_topics_topic video_topics_topic[]
}

model track_qa {
  qa_id      Int @id @default(autoincrement())
  level      Int @default(0)
  updated_at Int
}

model track_unit {
  topic_id       Int   @id @default(autoincrement())
  in_progress_qa Float @default(0.0)
  completed_qa   Float @default(0.0)
}

model video {
  id                 Int                  @id @default(autoincrement())
  name               String
  url                String
  playListId         String?
  teacherId          Int
  material           String
  branch             String
  updatedAt          DateTime             @default(now())
  categoryName       String?
  category           category?            @relation(fields: [categoryName, material], references: [name, material], onDelete: NoAction, onUpdate: NoAction)
  teacher            teacher              @relation(fields: [teacherId], references: [id], onDelete: NoAction, onUpdate: NoAction)
  video_topics_topic video_topics_topic[]
}

model video_topics_topic {
  videoId Int
  topicId Int
  topic   topic @relation(fields: [topicId], references: [id], onDelete: NoAction, onUpdate: NoAction)
  video   video @relation(fields: [videoId], references: [id], onDelete: Cascade)

  @@id([videoId, topicId])
  @@index([videoId], map: "IDX_55d1fc4dcebfdbef5bd2c4cf53")
  @@index([topicId], map: "IDX_1c867d6bdea0e571b9ef7d01a2")
}''',
        false);
    return PrismaClient.newClient(
        engine, PrismaActions(Lifecycle(engine), Raw(engine), TX(engine)));
  }

  final QueryEngine engine;

  final PrismaActions action;
}

class PrismaActions {
  PrismaActions(this.lifecycle, this.raw, this.tx);

  final Lifecycle lifecycle;

  final Raw raw;

  final TX tx;
}

// end of client
