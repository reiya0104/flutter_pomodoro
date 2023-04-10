import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/models/timer_mode.dart';

class TimerLoop {
  late TimerMode _timerMode;
  late int _remainingSeconds;
  late Timer _timer;
  late VoidCallback _onTick;
  late VoidCallback _onEnd;

  TimerLoop({
    required TimerMode timerMode,
    required VoidCallback onTick,
    required VoidCallback onEnd,
  }) {
    _timerMode = timerMode;
    _remainingSeconds = initialSeconds[_timerMode]!;
    _onTick = onTick;
    _onEnd = onEnd;
  }

  int get remainingSeconds => _remainingSeconds;
  TimerMode get timerMode => _timerMode;

  void decrementRemainingSeconds() {
    _remainingSeconds--;
  }

  void start() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      _onTick();
    });
  }

  void switchAndRestart() {
    _timer.cancel();

    if (_timerMode == TimerMode.work) {
      _timerMode = TimerMode.shortBreak;
    } else {
      _timerMode = TimerMode.work;
    }

    _remainingSeconds = initialSeconds[_timerMode]!;

    // setState(() {}) を呼び出す
    _onEnd();

    start();
  }

  void dispose() {
    _timer.cancel();
  }
}
