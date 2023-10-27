import 'package:get/get.dart';

class ApplicationState {
  final _page = 0.obs;
  int get page => _page.value;
  set page(int value) => _page.value = value;
}
