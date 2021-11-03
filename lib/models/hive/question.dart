import 'package:hive/hive.dart';

part 'question.g.dart';

@HiveType(typeId: 1)
class Question extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String statement;
  @HiveField(2)
  late String correctAnswer;
  @HiveField(3)
  late List<String> wrongAnswers;
  @HiveField(4)
  late int levelId;
  Question({
        this.id = 0,
        this.statement = '',
        this.correctAnswer = '',
        this.wrongAnswers = const ['','',''],
        this.levelId = 0,
        });
  @override
  String toString() {
    return '|qid:'+this.id.toString()
        // +'lid:'+this.levelId.toString()
        // +',statement:'+this.statement
        // +',correct:'+this.correctAnswer
        // +',wrongs:'+this.wrongAnswers.toString()
    ;
  }
}