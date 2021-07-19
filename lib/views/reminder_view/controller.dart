import 'package:get/get.dart';
import 'package:meditation_app/models/day_models.dart';

class ReminderController extends GetxController {
  selectDay(int index) {
    listDay[index].selected = !listDay[index].selected;
    update();
  }
}
