import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/widgets/timer_dial.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TimerDial', () {
    testWidgets('should display 25:00 initially', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TimerDial(),
        ),
      );
      expect(find.text('25:00'), findsOneWidget);
    });

    testWidgets('should display 24:59 after 1 second',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TimerDial(),
        ),
      );
      await tester.pump(const Duration(seconds: 1));
      expect(find.text('24:59'), findsOneWidget);
    });

    testWidgets('should display 00:00 after 25 minutes',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TimerDial(),
        ),
      );
      await tester.pump(const Duration(minutes: 25));
      expect(find.text('00:00'), findsOneWidget);
    });
  });
}
