import 'package:flutter/material.dart';

void main(
    ) {
  init();
 runApp(MaterialApp(
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
    ),
  ));
}
void init() async {
  
}