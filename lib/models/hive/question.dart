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
  Question({
        this.id = 0,
        this.statement = '',
        this.correctAnswer = '',
        this.wrongAnswers = const ['','',''],
        });
}