import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/models/timer_loop.dart';
import 'package:flutter_pomodoro/models/timer_mode.dart';

class TimerDial extends StatefulWidget {
  const TimerDial({Key? key}) : super(key: key);

  @override
  State<TimerDial> createState() => _TimerDialState();
}

class _TimerDialState extends State<TimerDial> {
  late TimerLoop _timerLoop;

  @override
  void initState() {
    super.initState();

    _timerLoop = TimerLoop(
        timerMode: TimerMode.work,
        onTick: () {
          if (_timerLoop.remainingSeconds == 0) {
            _timerLoop.switchAndRestart();
          } else {
            setState(() {
              _timerLoop.decrementRemainingSeconds();
            });
          }
        },
        onEnd: () {
          setState(() {});
        });
    _timerLoop.start();
  }

  String getRemainingTime() {
    int remainingMinutes = _timerLoop.remainingSeconds ~/ 60;
    int remainingSeconds = _timerLoop.remainingSeconds % 60;
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
    _timerLoop.dispose();
    super.dispose();
  }
}
