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
  @HiveField(5)
  late bool init;
  UserData(
      {this.nickname = 'John_Doe',
        this.id = 0,
        this.exp = 0,
        this.level = 0,
        this.version = 0,
        this.init = false });
  addEXP(int xp){
    int newLevel=100;
    this.exp+=xp;
    this.level= newLevel;//TODO: an actual function
  }
}