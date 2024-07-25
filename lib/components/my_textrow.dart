import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class MyTextRow extends StatelessWidget {
  final String helpText;
  final String coloredText;
  final Function()? onTap;

  const MyTextRow({
    super.key,
    required this.helpText,
    required this.coloredText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(helpText),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onTap,
          child: Text(
            coloredText,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
