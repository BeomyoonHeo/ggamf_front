import 'dart:async';

import 'package:flutter/services.dart';
import 'package:fullscreen/fullscreen.dart';

void enterFullScreen(FullScreenMode fullScreenMode) async {
  await FullScreen.enterFullScreen(fullScreenMode);
}

void exitFullScreen() async {
  await FullScreen.exitFullScreen();
}

// 2초 마다 전체화면을 유지 하기 위해 리스닝을 돈다.
class FullscreenService {
  Timer? timer;
  static FullscreenService? _instance;

  FullscreenService._internal() {
    timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      SystemChrome.restoreSystemUIOverlays();
    });
  }

  factory FullscreenService() => _instance ?? FullscreenService._internal();

  void cancelTimer() {
    timer!.cancel();
  }
}
