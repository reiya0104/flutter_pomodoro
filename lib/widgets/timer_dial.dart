import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/models/timer_mode.dart';

class TimerDial extends StatefulWidget {
  final TimerMode timerMode;

  const TimerDial({Key? key, required this.timerMode}) : super(key: key);

  @override
  State<TimerDial> createState() => _TimerDialState();
}

class _TimerDialState extends State<TimerDial> {
  static const Map<TimerMode, int> _initialSeconds = {
    TimerMode.work: 25 * 60,
    TimerMode.shortBreak: 5 * 60,
  };

  late int _remainingSeconds = _initialSeconds[widget.timerMode]!;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_remainingSeconds == 0) {
        timer.cancel();
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
}
