import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/models/timer_mode.dart';

class TimerDial extends StatefulWidget {
  const TimerDial({Key? key}) : super(key: key);

  @override
  State<TimerDial> createState() => _TimerDialState();
}

class _TimerDialState extends State<TimerDial> {
  static const Map<TimerMode, int> _initialSeconds = {
    TimerMode.work: 25 * 60,
    TimerMode.shortBreak: 5 * 60,
  };

  late TimerMode _timerMode;

  late int _remainingSeconds;

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timerMode = TimerMode.work;
    _setRemainingSeconds();

    startTimer();
  }

  void _setRemainingSeconds() {
    _remainingSeconds = _initialSeconds[_timerMode]!;
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_remainingSeconds == 0) {
        endTimer();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  String getRemainingTime() {
    int remainingMinutes = _remainingSeconds ~/ 60;
    int remainingSeconds = _remainingSeconds % 60;
    String remainingTime =
        '${remainingMinutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    return remainingTime;
  }

  @override
  Widget build(BuildContext context) {
    String remainingTime = getRemainingTime();
    return Text(
      remainingTime,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void endTimer() {
    // タイマーのモードを切り替えて再スタート

    _timer?.cancel();

    if (_timerMode == TimerMode.work) {
      _timerMode = TimerMode.shortBreak;
    } else {
      _timerMode = TimerMode.work;
    }

    _setRemainingSeconds();

    setState(() {});
    startTimer();
  }
}
