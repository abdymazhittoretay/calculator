// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String buttonText;

  const Buttons(
      {super.key,
      required this.buttonColor,
      required this.textColor,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            color: buttonColor,
            child: Center(
                child: Text(
              buttonText,
              style: TextStyle(color: textColor),
            )),
          )),
    );
  }
}
