import 'package:flutter/material.dart';

class StopButton extends StatelessWidget {
  const StopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(15, 12, 15, 12),
      ),
      child: const Text(
        'stop',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
