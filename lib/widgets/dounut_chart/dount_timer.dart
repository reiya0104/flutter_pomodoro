import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/models/dount_chart/chart_data.dart';
import 'package:flutter_pomodoro/models/timer_mode.dart';
import 'package:flutter_pomodoro/widgets/dounut_chart/donut_chart.dart';

class DountTimer extends StatelessWidget {
  final int remainingSeconds;
  final TimerMode timerMode;

  const DountTimer(
      {Key? key, required this.remainingSeconds, required this.timerMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DonutChart(
      chartRadius: 150,
      chartDataList: [
        ChartData(color: Colors.blue, value: 1.0),
        ChartData(color: Colors.grey, value: 0.0),
      ],
      chartStrokeWidth: 10,
    );
  }
}
