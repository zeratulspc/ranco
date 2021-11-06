import 'dart:async';

import 'package:get/get.dart';
import 'package:ranco/data/chords.dart';

class HomeController extends GetxController {
  final _chord = ''.obs;
  set chord(String v) => _chord.value = v;
  String get chord => _chord.value;

  final _time = 0.obs;
  set time(int v) => _time.value = v;
  int get time =>_time.value;

  final _flat = false.obs;
  set flat(bool v) => _flat.value = v;
  bool get flat => _flat.value;

  final _seventh = false.obs;
  set seventh(bool v) => _seventh.value = v;
  bool get seventh => _seventh.value;

  Timer? timer;

  setTimer(int target) {
    print("Set Timer");
    stopTimer();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(time == 0) {
        changeChord();
        time = target;
      }
      time--;
    });
  }

  stopTimer() {
    if(timer!=null) timer!.cancel();
    timer = null;
  }

  changeChord() {
    chord = Chords.getRandomChord(flat: flat, seventh: seventh);
  }
}