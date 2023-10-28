import 'package:firebase_chat/pages/photoview/index.dart';
import 'package:get/get.dart';

class PhotoImageViewController extends GetxController {
  final PhotoViewState state = PhotoViewState();

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    if (data['url'] != null) {
      state.url.value = data['url'] ?? "";
    }
  }
}
