// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            decoration: BoxDecoration(
              color: Colors.black
            ),
            child: Text("156"))),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: 16,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) {
                return ElevatedButton(
                    onPressed: () {}, child: Text(index.toString()));
              },
            ),
          )
        ],
      ),
    );
  }
}
