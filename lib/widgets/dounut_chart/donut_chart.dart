import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/models/dount_chart/chart_data.dart';
import 'package:flutter_pomodoro/models/dount_chart/dount_painter.dart';

class DonutChart extends StatelessWidget {
  final double chartRadius;
  final List<ChartData> chartDataList;
  final double chartStrokeWidth;

  const DonutChart(
      {super.key,
      required this.chartRadius,
      required this.chartDataList,
      required this.chartStrokeWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: chartRadius * 2,
      height: chartRadius * 2,
      child: CustomPaint(
        painter: DonutChartPainter(
            chartRadius: chartRadius,
            chartDataList: chartDataList,
            chartStrokeWidth: chartStrokeWidth),
      ),
    );
  }
}
