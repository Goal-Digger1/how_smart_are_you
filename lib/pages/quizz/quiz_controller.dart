import 'package:flutter/material.dart';
import 'package:how_smart_are_you/models/hive/level.dart';
import 'package:how_smart_are_you/models/hive/question.dart';
import 'package:how_smart_are_you/pages/home/home.dart';
import 'package:how_smart_are_you/pages/quizz/answer.dart';
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
  int _index = 0;
  bool answerSelected = false;
  void init(){
    QuizServices().setLevel(widget.level);
    _q = QuizServices().getCurrentQuestion();
    _randomAnswers = QuizServices().getRandomAnswers();
  }
  void goNext(bool done) async{
    if(done){
      await  QuizServices().completeQuiz();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Home()));
    }
    else{
      QuizServices().next();
    }

  }
  void _answerTapped(String s) async{
    bool retVal = QuizServices().submit(s);
    //await QuizServices().next();
    //print("Question ret val "+retVal.toString());
    setState(() {
      _scoreIcons.add(retVal ? Icon(
        Icons.check_circle,color: AppColors.Green,
      ) : Icon(
        Icons.clear, color: AppColors.Red,
      ));
      answerSelected = true;
    });
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
              ..._randomAnswers.map(
                      (answer) => Answer(text: answer,
                        answerColor: answerSelected ? (answer == _q.correctAnswer) ?
                        AppColors.Green : AppColors.RedLight : null ,
                        tapfuntion: (){
                        print("Clicked on answer:"+answer);
                        if(!answerSelected) _answerTapped(answer);
                        },)),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: (){
                    setState(() {

                      if(QuizServices().isLast())
                        {
                          goNext(true);

                        }
                      else{
                        goNext(false);
                        _q = QuizServices().getCurrentQuestion();
                        _randomAnswers = QuizServices().getRandomAnswers();
                      }
                      answerSelected = false;
                    });
                  },
                  child: Text(
              (QuizServices().getIndex() != widget.level.questions.length-1 ) ?
              "Next question" : "End quiz"
                  )),
              Container(
                padding: EdgeInsets.all(AppMargins.General),
                child: Text(
                  (QuizServices().getIndex()+1).toString()+"/"+
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
