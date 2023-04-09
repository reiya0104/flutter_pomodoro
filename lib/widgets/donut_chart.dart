import 'dart:math';

import 'package:flutter/material.dart';

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

class ChartData {
  final double value;
  final Color color;

  ChartData({required this.value, required this.color});
}

class DonutPath {
  final Color color;
  final Rect rect;
  final double startAngle;
  final double sweepAngle;

  DonutPath(
      {required this.color,
      required this.rect,
      required this.startAngle,
      required this.sweepAngle});

  Path getPath() {
    Path path = Path();
    path.arcTo(
      rect,
      startAngle,
      sweepAngle,
      false,
    );

    return path;
  }
}
