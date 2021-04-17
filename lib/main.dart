import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() {
    return _KeyPressState();
  }
}

class _KeyPressState extends State<DicePage> {
  var rng = new Random();
  static const int min = 1;
  static const int max = 7;
  int leftNum;
  int rightNum;

  @override
  Widget build(BuildContext context) {
    leftNum = getRandom();
    rightNum = getRandom();
    return Center(
      child: Row(
        children: [
          Expanded(
            // w that makes image fit
            child: FlatButton(
              onPressed: () {
                _changeDice();
                //print("Left button is pressed");
              },
              child: Image.asset('images/dice$leftNum.png'),
            ),
          ),
          Expanded(
            // w that makes image fit
            child: FlatButton(
              onPressed: () {
                _changeDice();
                //print("Right button is pressed");
              },
              child: Image.asset('images/dice$rightNum.png'),
            ),
          ),
          //Image(image: AssetImage('images/dice1.png')),
        ],
      ),
    );
  }

  int getRandom() {
    return 1 + rng.nextInt(6);
  }

  void _changeDice() {
    setState(() {
      leftNum = rightNum = getRandom();
    });
  }
}
