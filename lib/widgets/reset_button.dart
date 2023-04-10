import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(15, 12, 15, 12),
          backgroundColor: Colors.grey),
      child: const Text(
        'reset',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
