import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/widgets/clock.dart';
import 'package:flutter_pomodoro/widgets/reset_button.dart';
import 'package:flutter_pomodoro/widgets/start_button.dart';
import 'package:flutter_pomodoro/widgets/stop_button.dart';

void main() {
  runApp(const FlutterPomodoroApp());
}

class FlutterPomodoroApp extends StatelessWidget {
  const FlutterPomodoroApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pomodoro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppPage(),
    );
  }
}

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Clock(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                StartButton(),
                SizedBox(width: 50),
                StopButton(),
              ],
            ),
            const SizedBox(height: 30),
            const ResetButton(),
          ],
        ),
      ),
    );
  }
}
