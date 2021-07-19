import 'package:get/get.dart';

class MeditateController extends GetxController {
  RxInt categoryIndex = 0.obs;
  changeIndex(int index) {
    categoryIndex.value = index;
    update();
  }
}
