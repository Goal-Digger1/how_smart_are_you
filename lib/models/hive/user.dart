import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0)
  late String nickname;
  @HiveField(1)
  late int id;
  @HiveField(2)
  late int exp;
  @HiveField(3)
  late int level;
  @HiveField(4)
  late int version;
  UserData(
      {this.nickname = 'John_Doe',
        this.id = 0,
        this.exp = 0,
        this.level = 0,
        this.version = 0});
}