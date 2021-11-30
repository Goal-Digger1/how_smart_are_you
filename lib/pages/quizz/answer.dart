import 'package:flutter/material.dart';
import 'package:how_smart_are_you/services/ui.dart';

class Answer extends StatelessWidget {
  final text;
  final Color? answerColor;
  final  VoidCallback tapfuntion;
  const Answer({required this.text,required this.answerColor,required this.tapfuntion});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: tapfuntion,
        child: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(vertical: 5,
              horizontal: AppMargins.General),
          decoration: BoxDecoration(
              color: answerColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.Blue)
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 15
              ),
            ),
          ),
        )
    );
  }
}
