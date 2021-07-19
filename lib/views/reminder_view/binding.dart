import 'package:get/get.dart';
import 'package:meditation_app/views/reminder_view/controller.dart';

class ReminderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReminderController());
  }
}
