import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    body: const Center(
      child: Text(
        "\n\n\n\nHow smart are you?",
        style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlayfairDisplay'
        ),
      ),
    ),
    floatingActionButton: Container(
      height: 80.0,
      width: 250.0,
      child: FloatingActionButton(
        onPressed: () {  },
        child: const Text(
          'Register',
          //style:
        ),
        shape: BeveledRectangleBorder(),
        backgroundColor: Colors.redAccent,
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  ),
));