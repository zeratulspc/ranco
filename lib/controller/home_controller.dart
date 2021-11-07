import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ranco/data/chords.dart';
import 'package:ranco/ui/setting_sheet.dart';

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

  final _isStarted = false.obs;
  set isStarted(bool v) => _isStarted.value = v;
  bool get isStarted => _isStarted.value;

  Timer? timer;
  int targetTime = 0;

  openSettingSheet() {
    Get.bottomSheet(SettingSheet(),);
  }

  initTimer() {
    if(timer!=null) timer!.cancel();
    timer = null;
  }

  setTimer(int target) {
    initTimer();
    isStarted=true;
    targetTime = target;
    time = 0;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(time <= 0) {
        changeChord();
        time = target;
      }
      time--;
    });
  }

  stopTimer() {
    isStarted=false;
    initTimer();
  }

  changeChord() {
    chord = Chords.getRandomChord(flat: flat, seventh: seventh);
  }
}