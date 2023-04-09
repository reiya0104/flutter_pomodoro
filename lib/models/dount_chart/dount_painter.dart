import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/models/dount_chart/chart_data.dart';
import 'package:flutter_pomodoro/models/dount_chart/dount_path.dart';


class DonutChartPainter extends CustomPainter {
  final double chartRadius;
  final List<ChartData> chartDataList;
  final double chartStrokeWidth;

  List<DonutPath> _donutPathList = [];

  DonutChartPainter(
      {required this.chartRadius,
      required this.chartDataList,
      required this.chartStrokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint chartPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = chartStrokeWidth;

    double total = 0;
    for (var data in chartDataList) {
      total += data.value;
    }

    double startAngle = -pi / 2;

    // パスを格納するリスト
    List<DonutPath> donutPathList = [];

    for (int i = 0; i < chartDataList.length; i++) {
      ChartData data = chartDataList[i];
      double sweepAngle = (data.value / total) * 2 * pi;

      // data.value / total = 1 のとき、オーバーフローして描画されないことがあるため
      // 少し値を小さくする
      if (sweepAngle >= 2 * pi) {
        sweepAngle = 2 * pi - 0.0001;
      }

      chartPaint.color = data.color;

      // パスを作成し、リストに追加する
      DonutPath donutPath = DonutPath(
          color: data.color,
          rect: Rect.fromCircle(
            center: Offset(chartRadius, chartRadius),
            radius: chartRadius,
          ),
          startAngle: startAngle,
          sweepAngle: sweepAngle);

      donutPathList.add(donutPath);

      canvas.drawPath(donutPath.getPath(), chartPaint);

      startAngle += sweepAngle;
    }

    _donutPathList = donutPathList;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  List<DonutPath> getDonutPathList() {
    return _donutPathList;
  }
}
