import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String buttonText;

  const Buttons({super.key, required this.color, required this.textColor, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(),
    );
  }
}