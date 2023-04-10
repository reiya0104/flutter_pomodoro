import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/models/timer_loop.dart';
import 'package:flutter_pomodoro/models/timer_mode.dart';
import 'package:flutter_pomodoro/widgets/dounut_chart/dount_timer.dart';
import 'package:flutter_pomodoro/widgets/timer_dial.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
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

  @override
  Widget build(BuildContext context) {
    int remainingSeconds = _timerLoop.remainingSeconds;
    TimerMode timerMode = _timerLoop.timerMode;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        DountTimer(
          remainingSeconds: remainingSeconds,
          timerMode: timerMode,
        ),
        TimerDial(
          remainingSeconds: remainingSeconds,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timerLoop.dispose();
    super.dispose();
  }
}
