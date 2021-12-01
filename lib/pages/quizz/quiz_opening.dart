

import 'package:flutter/material.dart';
import 'package:how_smart_are_you/models/hive/level.dart';
import 'package:how_smart_are_you/pages/quizz/quiz_controller.dart';
import 'package:how_smart_are_you/services/WidgetService.dart';
import 'package:how_smart_are_you/services/ui.dart';

class QuizIntro extends StatelessWidget {
  final Level level;
  const QuizIntro({required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetService().getAppbar(context),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Are you ready for this challenge?',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PlayfairDisplay'
              ),),
            Container(
              height: 80.0,
              width: 200.0,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)
                  ),
                  child: Text(
                      "Start Level :" + level.id.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                      onPressed: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizController(level: level,)));
                      }
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
