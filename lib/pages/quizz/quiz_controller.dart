import 'package:flutter/material.dart';
import 'package:how_smart_are_you/models/hive/level.dart';
import 'package:how_smart_are_you/services/WidgetService.dart';
class QuizController extends StatefulWidget {
  final Level level;
  const QuizController({required this.level});

  @override
  _QuizControllerState createState() => _QuizControllerState();
}

class _QuizControllerState extends State<QuizController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  WidgetService().getAppbar(context),
    );
  }
}
