// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:calculator/pages/buttons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "+/-",
    "0",
    ".",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(child: Container()),
          Expanded(
              flex: 2,
              child: Container(
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        if (index < 3) {
                          return Buttons(
                              buttonColor: Colors.grey.shade800,
                              textColor: Colors.white,
                              buttonText: buttons[index]);
                        } else {
                          return Buttons(
                              buttonColor: isRightSideButtons(buttons[index])
                                  ? Colors.orange
                                  : Colors.grey.shade900,
                              textColor: Colors.white,
                              buttonText: buttons[index]);
                        }
                      })))
        ],
      ),
    );
  }

  // Functions
  bool isRightSideButtons(String buttonText) {
    if (buttonText == "/" ||
        buttonText == "x" ||
        buttonText == "-" ||
        buttonText == "+" ||
        buttonText == "=") {
      return true;
    }
    return false;
  }
}
