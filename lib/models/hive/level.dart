import 'package:hive/hive.dart';
part 'level.g.dart';

@HiveType(typeId: 2)
class Level extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late int expRequired;
  @HiveField(2)
  late HiveList questions;
  @HiveField(3)
  late bool completed;
  @HiveField(4)
  late int categoryId;
  Level({
    this.id = 0,
    this.expRequired = 0,
    this.categoryId = 0,
    this.completed = false ,
  });
  bool isCompleted() => this.completed;
  updateStatus(bool value){this.completed=value;}
  @override
  String toString() {
    return '\n|lid:'+this.id.toString()
        // +'cid:'+this.categoryId.toString()
        +',xp:'+this.expRequired.toString()
        +','+this.completed.toString()
        +this.questions.toString();
  }
}