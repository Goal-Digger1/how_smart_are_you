import 'package:flutter/material.dart';
import 'package:how_smart_are_you/models/hive/level.dart';
import 'package:how_smart_are_you/models/hive/question.dart';
import 'package:how_smart_are_you/services/QuizServices.dart';
import 'package:how_smart_are_you/services/WidgetService.dart';
import 'package:how_smart_are_you/services/ui.dart';
class QuizController extends StatefulWidget {
  final Level level;
  const QuizController({required this.level});

  @override
  _QuizControllerState createState() => _QuizControllerState();
}

class _QuizControllerState extends State<QuizController> {
  List<Icon> _scoreIcons = [];
  late Question _q;
  late List<String> _randomAnswers;

  void init(){
    QuizServices().setLevel(widget.level);
    _q = QuizServices().getCurrentQuestion();
    _randomAnswers = QuizServices().getRandomAnswers();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  WidgetService().getAppbar(context),
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  if(_scoreIcons.isEmpty)
                    SizedBox(height: 25,),
                  if(_scoreIcons.isNotEmpty)
                    ..._scoreIcons
                ],
              ),
              Container(
                width: double.infinity,
                height: 120,
                margin: EdgeInsets.all(AppMargins.General),
                padding: EdgeInsets.symmetric(
                  horizontal: AppMargins.General,
                  vertical: AppMargins.Secondary
                ),
                decoration: BoxDecoration(
                  color: AppColors.Orange,
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Center(
                  child: Text(
                    _q.statement,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(vertical: 5,
                horizontal: AppMargins.General),
                decoration: BoxDecoration(
                  color: null,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.Blue)
                ),
                  child: Center(
                    child: Text(
                      _randomAnswers[0],
                      style: TextStyle(
                        fontSize: 15
                      ),
                    ),
                  ),
                )
              ),
              InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(vertical: 5,
                        horizontal: AppMargins.General),
                    decoration: BoxDecoration(
                        color: null,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.Blue)
                    ),
                    child: Center(
                      child: Text(
                        _randomAnswers[1],
                        style: TextStyle(
                            fontSize: 15
                        ),
                      ),
                    ),
                  )
              ),
              InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(vertical: 5,
                        horizontal: AppMargins.General),
                    decoration: BoxDecoration(
                        color: null,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.Blue)
                    ),
                    child: Center(
                      child: Text(
                        _randomAnswers[2],
                        style: TextStyle(
                            fontSize: 15
                        ),
                      ),
                    ),
                  )
              ),
              InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(vertical: 5,
                        horizontal: AppMargins.General),
                    decoration: BoxDecoration(
                        color: null,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.Blue)
                    ),
                    child: Center(
                      child: Text(
                        _randomAnswers[3],
                        style: TextStyle(
                            fontSize: 15
                        ),
                      ),
                    ),
                  )
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: (){},
                  child: Text("Next question")),
              Container(
                padding: EdgeInsets.all(AppMargins.General),
                child: Text(
                    QuizServices().getScore().toString()+"/"+
                    widget.level.questions.length.toString(),
                  style: TextStyle(
                    fontSize: 40,fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
      ),

    );
  }
}
