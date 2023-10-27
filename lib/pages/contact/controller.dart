import 'dart:convert';

import 'package:firebase_chat/common/entities/entities.dart';
import 'package:firebase_chat/common/store/store.dart';
import 'package:firebase_chat/pages/contact/index.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactController extends GetxController {
  final state = ContactState();
  ContactController();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;

  @override
  onReady() async {
    super.onReady();
    await asyncLoadAllData();
  }

  goChat(UserData toUserData) async {
    var from_messages = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("from_uid", isEqualTo: token)
        .where("to_uid", isEqualTo: toUserData.id)
        .get();

    var to_messages = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("from_uid", isEqualTo: toUserData.id)
        .where("to_uid", isEqualTo: token)
        .get();

    if (from_messages.docs.isEmpty && to_messages.docs.isEmpty) {
      String profile = await UserStore.to.getProfile();
      UserLoginResponseEntity userData =
          UserLoginResponseEntity.fromJson(jsonDecode(profile));

      var msgData = Msg(
          from_uid: userData.accessToken,
          to_uid: toUserData.id,
          from_name: userData.displayName,
          to_name: toUserData.name,
          from_avatar: userData.photoUrl,
          to_avatar: toUserData.photourl,
          last_msg: "",
          last_time: Timestamp.now(),
          msg_num: 0);

      db
          .collection("message")
          .withConverter(
              fromFirestore: Msg.fromFirestore,
              toFirestore: (Msg msg, options) => msg.toFirestore())
          .add(msgData)
          .then((value) => {
                Get.toNamed("/chat", parameters: {
                  "doc_id": value.id,
                  "to_uid": toUserData.id ?? "",
                  "to_name": toUserData.name ?? "",
                  "to_avatar": toUserData.photourl ?? "",
                })
              });
      return;
    }

    if (from_messages.docs.isNotEmpty) {
      Get.toNamed("/chat", parameters: {
        "doc_id": from_messages.docs.first.id,
        "to_uid": toUserData.id ?? "",
        "to_name": toUserData.name ?? "",
        "to_avatar": toUserData.photourl ?? "",
      });
      return;
    }

    if (to_messages.docs.isNotEmpty) {
      Get.toNamed("/chat", parameters: {
        "doc_id": to_messages.docs.first.id,
        "to_uid": toUserData.id ?? "",
        "to_name": toUserData.name ?? "",
        "to_avatar": toUserData.photourl ?? "",
      });
    }
  }

  asyncLoadAllData() async {
    var usersBase = await db
        .collection("users")
        .where("id", isNotEqualTo: token)
        .withConverter(
            fromFirestore: UserData.fromFirestore,
            toFirestore: (UserData userdata, options) => userdata.toFirestore())
        .get();

    for (var doc in usersBase.docs) {
      state.contactList.add(doc.data());
      print(doc.toString());
    }
  }
}
