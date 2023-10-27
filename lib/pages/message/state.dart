import 'package:firebase_chat/common/entities/entities.dart';
import "package:get/get.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class MessageState {
  RxList<QueryDocumentSnapshot<Msg>> msgList =
      <QueryDocumentSnapshot<Msg>>[].obs;
}
