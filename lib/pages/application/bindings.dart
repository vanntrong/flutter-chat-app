import 'package:firebase_chat/pages/application/index.dart';
import 'package:firebase_chat/pages/contact/controller.dart';
import 'package:firebase_chat/pages/message/controller.dart';
import 'package:firebase_chat/pages/profile/controller.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
