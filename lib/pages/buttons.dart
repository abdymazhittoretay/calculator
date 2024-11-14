// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String buttonText;
  final void Function()? onTap;

  const Buttons(
      {super.key,
      required this.buttonColor,
      required this.textColor,
      required this.buttonText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: buttonColor,
              child: Center(
                  child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: 32.0),
              )),
            )),
      ),
    );
  }
}
