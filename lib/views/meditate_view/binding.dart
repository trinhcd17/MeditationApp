import 'package:get/get.dart';
import 'package:meditation_app/views/meditate_view/controller.dart';

class MeditateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MeditateController());
  }
}
