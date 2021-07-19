import 'package:get/get.dart';

class RootAppController extends GetxController {
  RxInt index = 0.obs;
  RxBool darkMode = false.obs;
  changeIndex(int x) {
    index.value = x;
    update();
  }

  showDarkMode(bool status) {
    darkMode.value = status;
  }
}
