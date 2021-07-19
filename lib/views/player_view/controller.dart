import 'dart:async';

import 'package:get/get.dart';

class PlayerViewController extends GetxController {
  RxDouble sliderValue = 0.0.obs;
  RxBool playing = false.obs;
  final duration = Duration(seconds: 1);
  Timer timer;
  sliderChange(double value) {
    sliderValue.value = value;
  }

  next15s(double max) {
    var temp = sliderValue.value += 15;
    sliderValue.value = temp > max ? max : temp;
  }

  previous15() {
    var temp = sliderValue.value -= 15;
    sliderValue.value = temp < 0 ? 0 : temp;
  }

  play(double max) {
    playing.value = true;
    timer = new Timer.periodic(duration, (timer) {
      if (sliderValue.value < max) {
        sliderValue.value++;
      } else {
        timer.cancel();
      }
    });
    if (sliderValue.value == max) {
      playing.value = false;
    }
  }

  replay() {
    sliderValue.value = 0;
    playing.value = false;
  }

  pause() {
    timer.cancel();
    playing.value = false;
  }

  stop() {
    timer.cancel();
    playing.value = false;
    sliderValue.value = 0;
  }
}
