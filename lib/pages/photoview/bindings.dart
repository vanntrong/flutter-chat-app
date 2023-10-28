import 'package:firebase_chat/pages/photoview/controller.dart';
import 'package:get/get.dart';

class PhotoViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoImageViewController>(() => PhotoImageViewController());
  }
}
