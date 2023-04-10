import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/models/dount_chart/chart_data.dart';
import 'package:flutter_pomodoro/widgets/dounut_chart/donut_chart.dart';
import 'package:flutter_pomodoro/widgets/timer_dial.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

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
        const TimerDial(),
      ],
    );
  }
}
