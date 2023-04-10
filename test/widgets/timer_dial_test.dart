import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/widgets/timer_dial.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TimerDial', () {
    testWidgets('should display 25:00 initially in work mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TimerDial(
            remainingSeconds: 25 * 60,
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
            remainingSeconds: 25 * 60 - 1,
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
            remainingSeconds: 0,
          ),
        ),
      );
      await tester.pump(const Duration(minutes: 25));
      expect(find.text('00:00'), findsOneWidget);
    });

    testWidgets(
        'should display 05:00 after 25 minutes and 1 second in work mode, then transisting to short break mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TimerDial(
            remainingSeconds: 5 * 60,
          ),
        ),
      );
      await tester.pump(const Duration(minutes: 25, seconds: 1));
      expect(find.text('05:00'), findsOneWidget);
    });

    testWidgets(
        'should display 00:00 after 30 minutes and 1 second in work mode, then transisting to short break mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TimerDial(
            remainingSeconds: 0,
          ),
        ),
      );
      await tester.pump(const Duration(minutes: 30, seconds: 1));
      expect(find.text('00:00'), findsOneWidget);
    });

    testWidgets(
        'should display 25:00 after 30 minutes and 2 second in work mode, then transisting to work mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TimerDial(
            remainingSeconds: 25 * 60,
          ),
        ),
      );
      await tester.pump(const Duration(minutes: 30, seconds: 2));
      expect(find.text('25:00'), findsOneWidget);
    });
  });
}
