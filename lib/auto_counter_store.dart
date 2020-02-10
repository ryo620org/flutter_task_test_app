import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// 通知するクラス
class Clock with ChangeNotifier {
  String time;

  Clock() {
    time = _getNowTime();
    Timer.periodic(Duration(seconds: 1), (timer) {
      time = _getNowTime();
      notifyListeners();
    });
  }

  String _getNowTime() {
    var now = DateTime.now();
    var formatter = DateFormat('HH:mm:ss');
    var formattedTime = formatter.format(now);
    return formattedTime;
  }
}
