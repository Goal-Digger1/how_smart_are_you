import 'package:hive/hive.dart';
part 'level.g.dart';

@HiveType(typeId: 2)
class Level extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late int expRequired;
  @HiveField(2)
  late List<int> questionIds;
  Level({
    this.id = 0,
    this.expRequired = 0,
    this.questionIds = const [0,0,0,0,0],
  });
}