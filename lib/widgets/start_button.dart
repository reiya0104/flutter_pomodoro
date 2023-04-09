import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(15, 12, 15, 12),
      ),
      child: const Text(
        'start',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
