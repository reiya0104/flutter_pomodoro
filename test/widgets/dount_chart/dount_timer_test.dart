import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/models/timer_mode.dart';
import 'package:flutter_pomodoro/widgets/dounut_chart/donut_chart.dart';
import 'package:flutter_pomodoro/widgets/dounut_chart/dount_timer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DountTimer widget test', () {
    testWidgets('Display a blue DonutChart in work mode',
        (WidgetTester tester) async {
      // remainingSeconds = 1500（25分）, timerMode = work とする
      await tester.pumpWidget(const MaterialApp(
        home: DountTimer(remainingSeconds: 1500, timerMode: TimerMode.work),
      ));

      final donutChartFinder = find.byType(DonutChart);
      expect(donutChartFinder, findsOneWidget);
      final donutChartWidget =
          donutChartFinder.evaluate().first.widget as DonutChart;
      // 色の確認
      expect(donutChartWidget.chartDataList.first.color, equals(Colors.blue));
      // 値が 1.0（remainingSeconds / maxSeconds）であることを確認する
      expect(donutChartWidget.chartDataList.first.value, equals(1.0));
    });

    testWidgets(
        'Display a blue DonutChart after 12 minutes and 30 seconds in work mode',
        (WidgetTester tester) async {
      // remainingSeconds = 750（12分30秒）, timerMode = work とする
      await tester.pumpWidget(const MaterialApp(
        home: DountTimer(remainingSeconds: 750, timerMode: TimerMode.work),
      ));

      final donutChartFinder = find.byType(DonutChart);
      expect(donutChartFinder, findsOneWidget);
      final donutChartWidget =
          donutChartFinder.evaluate().first.widget as DonutChart;
      // 色の確認
      expect(donutChartWidget.chartDataList.first.color, equals(Colors.blue));
      // 値が 0.5（remainingSeconds / maxSeconds）であることを確認する
      expect(donutChartWidget.chartDataList.first.value, equals(0.5));
    });

    testWidgets('Display a light green DonutChart in shortBreak mode',
        (WidgetTester tester) async {
      // remainingSeconds = 300（5分）, timerMode = shortBreak とする
      await tester.pumpWidget(const MaterialApp(
        home:
            DountTimer(remainingSeconds: 300, timerMode: TimerMode.shortBreak),
      ));

      final donutChartFinder = find.byType(DonutChart);
      expect(donutChartFinder, findsOneWidget);
      final donutChartWidget =
          donutChartFinder.evaluate().first.widget as DonutChart;
      // 色の確認
      expect(donutChartWidget.chartDataList.first.color,
          equals(Colors.lightGreen));
      // 値が 1.0（remainingSeconds / maxSeconds）であることを確認する
      expect(donutChartWidget.chartDataList.first.value, equals(1.0));
    });
  });
}
