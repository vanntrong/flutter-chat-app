import 'package:firebase_chat/common/entities/user.dart';
import 'package:get/get.dart';

class ProfileState {
  var head_detail = Rx<UserLoginResponseEntity?>(null);
  RxList<MeListItem> meListItem = <MeListItem>[].obs;
}
