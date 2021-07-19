import 'package:get/get.dart';
import 'package:meditation_app/views/meditate_view/controller.dart';
import 'package:meditation_app/views/root_app/controller.dart';

class RootAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RootAppController());
    Get.put(MeditateController());
  }
}
