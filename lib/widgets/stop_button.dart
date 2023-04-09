import 'package:flutter/material.dart';

class StopButton extends StatelessWidget {
  const StopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
      onPressed: null,
      child: Text(
        'stop',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
