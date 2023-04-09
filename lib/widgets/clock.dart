import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/widgets/donut_chart.dart';

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
            ChartData(color: Colors.blue, value: 1.1),
            ChartData(color: Colors.grey, value: 0.0),
            ChartData(color: Colors.black, value: 0.0),
          ],
          chartStrokeWidth: 10,
        ),
        Text(
          '25:00',
          style: Theme.of(context).textTheme.headlineMedium,
        )
      ],
    );
  }
}
