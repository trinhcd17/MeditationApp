import 'package:get/get.dart';
import 'package:meditation_app/views/player_view/controller.dart';

class PlayerViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PlayerViewController());
  }
}
