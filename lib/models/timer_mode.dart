import 'package:flutter/material.dart';

enum TimerMode {
  work,
  shortBreak,
}

const Map<TimerMode, int> initialSeconds = {
  TimerMode.work: 25 * 60,
  TimerMode.shortBreak: 5 * 60,
};

const Map<TimerMode, Color> dountColorMap = {
  TimerMode.work: Colors.blue,
  TimerMode.shortBreak: Colors.lightGreen,
};
