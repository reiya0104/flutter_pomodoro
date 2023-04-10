import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/models/dount_chart/chart_data.dart';
import 'package:flutter_pomodoro/models/timer_loop.dart';
import 'package:flutter_pomodoro/models/timer_mode.dart';
import 'package:flutter_pomodoro/widgets/dounut_chart/donut_chart.dart';
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
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        DonutChart(
          chartRadius: 150,
          chartDataList: [
            ChartData(color: Colors.blue, value: 1.0),
            ChartData(color: Colors.grey, value: 0.0),
          ],
          chartStrokeWidth: 10,
        ),
        TimerDial(
          remainingSeconds: _timerLoop.remainingSeconds,
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
