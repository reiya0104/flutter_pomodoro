import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/widgets/clock.dart';
import 'package:flutter_pomodoro/widgets/start_button.dart';

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
          children: const <Widget>[
            Clock(),
            StartButton(),
          ],
        ),
      ),
    );
  }
}
