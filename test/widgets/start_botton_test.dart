import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/widgets/start_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Start button test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: StartButton(),
    ));

    expect(find.text('start'), findsOneWidget);
  });
}
