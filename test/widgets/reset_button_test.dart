import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/widgets/reset_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Stop button test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ResetButton(),
    ));

    expect(find.text('reset'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is ElevatedButton),
        findsOneWidget);
  });
}
