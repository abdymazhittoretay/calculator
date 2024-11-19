// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:calculator/pages/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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

  var userQuestion = "";
  var userAnswer = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.only(right: 8.0, bottom: 15.0),
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Text(userQuestion,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 36)),
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Text(
                    userAnswer,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Buttons(
                        buttonColor: Colors.grey.shade800,
                        textColor: Colors.white,
                        buttonText: buttons[index],
                        onTap: () {
                          setState(() {
                            userAnswer = "";
                            userQuestion = "";
                          });
                        },
                      );
                    } else if (index == 1) {
                      return Buttons(
                        buttonColor: Colors.grey.shade800,
                        textColor: Colors.white,
                        buttonText: buttons[index],
                        onTap: () {
                          setState(() {
                            userQuestion = "";
                            userAnswer = userAnswer.substring(
                                0,
                                userAnswer.isNotEmpty
                                    ? userAnswer.length - 1
                                    : 0);
                          });
                        },
                      );
                      // else if(isCalc)
                    } else if (index == buttons.length - 1) {
                      return Buttons(
                        buttonColor: Colors.orange,
                        textColor: Colors.white,
                        buttonText: buttons[index],
                        onTap: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                      );
                    } else if (index == buttons.length - 4) {
                      return Buttons(
                        buttonColor: Colors.grey.shade900,
                        textColor: Colors.white,
                        buttonText: buttons[index],
                        onTap: () {
                          setState(() {
                            userAnswer += 'x(-1)';
                          });
                        },
                      );
                    } else {
                      return Buttons(
                          buttonColor: isRightSideButtons(buttons[index])
                              ? Colors.orange
                              : buttons[index] == "%"
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade900,
                          textColor: Colors.white,
                          buttonText: buttons[index],
                          onTap: () {
                            setState(() {
                              if (userAnswer.isNotEmpty &&
                                  isCalculation(buttons[index]) &&
                                  isCalculation(
                                      userAnswer[userAnswer.length - 1])) {
                                userAnswer = userAnswer.substring(
                                    0, userAnswer.length - 1);
                                userAnswer += buttons[index];
                              } else if (userAnswer.isNotEmpty &&
                                  isCalculation(buttons[index])) {
                                userAnswer += buttons[index];
                              } else {
                                userAnswer += buttons[index];
                              }
                            });
                          });
                    }
                  })),
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

  bool isCalculation(String buttonText) {
    if (buttonText == "/" ||
        buttonText == "x" ||
        buttonText == "-" ||
        buttonText == "+") {
      return true;
    }
    return false;
  }

  void equalPressed() {
    userQuestion = userAnswer;

    if (userAnswer[userAnswer.length - 1] == "%") {
      userAnswer = userAnswer.substring(0, userAnswer.length - 1);
      userAnswer += "/100";
    }

    String finalUserQuestion = userAnswer;
    finalUserQuestion = finalUserQuestion.replaceAll("x", "*");

    Parser p = Parser();
    Expression exp = p.parse(finalUserQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    if ((eval % 1) == 0) {
      userAnswer = eval.toInt().toString();
    } else if ((eval % 1) != 0 && eval.toString().length > 9) {
      userAnswer = eval.toStringAsFixed(9);
    } else {
      userAnswer = eval.toString();
    }
  }
}
