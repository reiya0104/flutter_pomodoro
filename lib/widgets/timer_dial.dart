import 'package:flutter/material.dart';

class TimerDial extends StatelessWidget {
  final int remainingSeconds;

  const TimerDial({Key? key, required this.remainingSeconds}) : super(key: key);

  String getRemainingTime() {
    int remainingMinutes = this.remainingSeconds ~/ 60;
    int remainingSeconds = this.remainingSeconds % 60;
    String remainingTime =
        '${remainingMinutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    return remainingTime;
  }

  @override
  Widget build(BuildContext context) {
    String remainingTime = getRemainingTime();
    return Text(
      remainingTime,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
