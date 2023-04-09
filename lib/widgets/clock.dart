import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '00:00',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}