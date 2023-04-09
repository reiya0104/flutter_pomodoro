import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/models/dount_chart/chart_data.dart';
import 'package:flutter_pomodoro/models/dount_chart/dount_painter.dart';
import 'package:flutter_pomodoro/widgets/donut_chart.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DonutChart displays data correctly',
      (WidgetTester tester) async {
    // テストデータ
    final List<ChartData> testData = [
      ChartData(value: 30, color: Colors.red),
      ChartData(value: 40, color: Colors.green),
      ChartData(value: 20, color: Colors.blue),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: DonutChart(
          chartRadius: 50,
          chartDataList: testData,
          chartStrokeWidth: 10,
        ),
      ),
    );

    // CustomPaint の widget を取得する
    final customPaint = find.byType(CustomPaint);

    // CustomPaint があることを確認する
    expect(customPaint, findsWidgets);

    // DonutChartPainter である CustomPainter があることを確認する
    final customPainter =
        (customPaint.evaluate().last.widget as CustomPaint).painter;
    expect(customPainter, isA<DonutChartPainter>());

    // DonutChartPainter のプロパティのデータがテストデータと一致していることを確認する
    final donutChartPainter = customPainter as DonutChartPainter;
    expect(donutChartPainter.chartRadius, equals(50));
    expect(donutChartPainter.chartDataList, equals(testData));
    expect(donutChartPainter.chartStrokeWidth, equals(10));

    // 各データに正しいパスが描かれていることを確認する
    final pathList = donutChartPainter.getDonutPathList();
    expect(pathList.length, equals(testData.length));

    for (int i = 0; i < testData.length; i++) {
      final path = pathList[i];
      final data = testData[i];

      // パスの色を確認する
      expect(path.color, equals(data.color));

      // startAngle と sweepAngle の確認をする
      final totalValue = testData.fold(0.0, (sum, data) => sum + data.value);
      final startAngle = (-pi / 2) +
          (2 *
              pi *
              (testData
                      .sublist(0, i)
                      .fold(0.0, (sum, data) => sum + data.value) /
                  totalValue));
      final sweepAngle = (2 * pi * (data.value / totalValue));
      expect(path.startAngle, closeTo(startAngle, 0.001));
      expect(path.sweepAngle, closeTo(sweepAngle, 0.001));
    }
  });
}
