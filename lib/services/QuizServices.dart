

import 'package:how_smart_are_you/models/hive/level.dart';
import 'package:how_smart_are_you/models/hive/question.dart';

class QuizServices{
  static final QuizServices _instance = QuizServices._internal();
  factory QuizServices() => _instance;
  QuizServices._internal();
   late Level _lvl;
   late List<String> _answers;
   late List<Question> _questions;
   late Question currentQuestion;
   late int _score = 0;
   late int _index = _questions.indexOf(_questions.first);
  void setLevel( Level x){
    _answers = [];
    _lvl=x;
    _index = 0;
    _questions = x.questions.cast();
    _score=0;
    currentQuestion = x.questions.cast().first;
  }
  String getStatement() => currentQuestion.statement;
  int getScore() => _score;
  Question getCurrentQuestion() => currentQuestion;
  Future<int> next(String answer) async{
    if(answer == currentQuestion.correctAnswer) _score++;
    if (_index < _questions.length) {
      _index++;
      currentQuestion = _questions.elementAt(_index);
      return 0; //nui gata
    }
    if(_index == _questions.length) {
      if(_score > _questions.length / 2){
        _lvl.updateStatus(true);
        await _lvl.save();
        return 1; //trecut
      }
    }
      return -1; //picat
  }
  int getLength() => _questions.length;
  List<String> getRandomAnswers(){
    print("CurQWR"+currentQuestion.wrongAnswers.toString());
    print("CurQCor"+currentQuestion.correctAnswer);
    _answers = [ currentQuestion.wrongAnswers[0],
      currentQuestion.wrongAnswers[1],
      currentQuestion.wrongAnswers[2],
      currentQuestion.correctAnswer
    ];
    _answers.shuffle();
    print(_answers);
    return _answers;
  }
}