import "package:flutter/material.dart";

class MyTextRow extends StatelessWidget {
  final String helpText;
  final String coloredText;

  const MyTextRow(
      {super.key, required this.helpText, required this.coloredText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(helpText),
        const SizedBox(width: 4),
        Text(
          coloredText,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
