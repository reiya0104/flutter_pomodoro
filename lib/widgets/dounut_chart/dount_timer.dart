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

  double getDountRate() {
    int maxSeconds = initialSeconds[timerMode]!;
    double dountRate = (remainingSeconds.toDouble()) / (maxSeconds.toDouble());

    return dountRate;
  }

  @override
  Widget build(BuildContext context) {
    Color dountColor = dountColorMap[timerMode]!;
    double dountRate = getDountRate();

    return DonutChart(
      chartRadius: 150,
      chartDataList: [
        ChartData(color: dountColor, value: dountRate),
        ChartData(color: Colors.grey, value: 1.0 - dountRate),
      ],
      chartStrokeWidth: 10,
    );
  }
}
