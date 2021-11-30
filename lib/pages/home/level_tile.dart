import 'package:flutter/material.dart';
import 'package:how_smart_are_you/models/hive/level.dart';
import 'package:how_smart_are_you/pages/quizz/quiz_controller.dart';
import 'package:how_smart_are_you/pages/quizz/quiz_opening.dart';
import 'package:how_smart_are_you/services/HiveServices.dart';
import 'package:how_smart_are_you/services/ui.dart';

class LevelTile extends StatelessWidget {
  final Level level;
  final int index;
  final _exp=HiveServices().getUser().exp;
   LevelTile({required this.level,required this.index});


  @override
  Widget build(BuildContext context) {
    final bool disabled=(level.expRequired > _exp);
    final bool completed=(level.completed);
    if(completed){
      return InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => QuizController(level: level,)));
        },
        child: Card(
            color: AppColors.Greenlight,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(AppMargins.General),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      index.toString(),
                      style: TextStyle(
                        fontSize: AppFontSizes.M,
                        fontWeight: FontWeight.bold,
                        color: AppColors.Blue,
                      ),
                    ),
                  ),
                  Icon(Icons.check_box),
                ],
              ),
            )),
      );
    }
    else if(disabled){
      return Opacity(
        opacity: 0.5,
        child: Card(
            color: AppColors.Grey,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(AppMargins.General),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      index.toString(),
                      style: TextStyle(
                        fontSize: AppFontSizes.M,
                        fontWeight: FontWeight.bold,
                        color: AppColors.Blue,
                      ),
                    ),
                  ),
                  Icon(Icons.block),
                ],
              ),
            )),
      );
    }
    else
      return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => QuizIntro(level: level,)));
      },
      child: Card(
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.all(AppMargins.General),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    index.toString(),
                    style: TextStyle(
                      fontSize: AppFontSizes.M,
                      fontWeight: FontWeight.bold,
                      color: AppColors.Blue,
                    ),
                  ),
                ),
                Icon(Icons.play_arrow),
              ],
            ),
          )),
    );

  }
}
