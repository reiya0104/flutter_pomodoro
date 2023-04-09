import 'package:flutter/material.dart';

class DonutPath {
  final Color color;
  final Rect rect;
  final double startAngle;
  final double sweepAngle;

  DonutPath(
      {required this.color,
      required this.rect,
      required this.startAngle,
      required this.sweepAngle});

  Path getPath() {
    Path path = Path();
    path.arcTo(
      rect,
      startAngle,
      sweepAngle,
      false,
    );

    return path;
  }
}
