import 'package:flutter_pomodoro/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('FlutterPomodoroApp test', (WidgetTester tester) async {
    await tester.pumpWidget(const FlutterPomodoroApp());

    // clock
    expect(find.text('25:00'), findsOneWidget);

    // start button
    expect(find.text('start'), findsOneWidget);

    // stop button
    expect(find.text('stop'), findsOneWidget);
  });
}
