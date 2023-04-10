import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/models/timer_mode.dart';
import 'package:flutter_pomodoro/widgets/timer_dial.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TimerDial', () {
    testWidgets('should display 25:00 initially in work mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TimerDial(
            timerMode: TimerMode.work,
          ),
        ),
      );
      expect(find.text('25:00'), findsOneWidget);
    });

    testWidgets('should display 24:59 after 1 second in work mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TimerDial(
            timerMode: TimerMode.work,
          ),
        ),
      );
      await tester.pump(const Duration(seconds: 1));
      expect(find.text('24:59'), findsOneWidget);
    });

    testWidgets('should display 00:00 after 25 minutes in work mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TimerDial(
            timerMode: TimerMode.work,
          ),
        ),
      );
      await tester.pump(const Duration(minutes: 25));
      expect(find.text('00:00'), findsOneWidget);
    });

    testWidgets('should display 05:00 initially in short break mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TimerDial(timerMode: TimerMode.shortBreak),
        ),
      );

      expect(find.text('05:00'), findsOneWidget);
    });
  });
}
