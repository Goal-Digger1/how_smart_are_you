import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    body: const Center(
      child: Text(
        'How smart are you?',
        style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlayfairDisplay'
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {  },
      child: const Text(
        'Register',
        //style:
      ),

      backgroundColor: Colors.redAccent,
    ),
  ),
));