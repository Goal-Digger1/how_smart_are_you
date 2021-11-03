
import 'package:hive/hive.dart';
import 'package:how_smart_are_you/models/hive/category.dart';
import 'package:how_smart_are_you/models/hive/level.dart';
import 'package:how_smart_are_you/models/hive/question.dart';
import 'package:how_smart_are_you/models/hive/user.dart';

class HiveServices{
  late final Box<UserData> userBox;
  late final Box<Question> questionsBox;
  late final Box<Level> levelsBox;
  late final Box<Category> categoriesBox;

  static final HiveServices _instance = HiveServices._internal();

  factory HiveServices() => _instance;

  HiveServices._internal();
  Future<void> initHive() async {
    Hive
        ..registerAdapter(UserDataAdapter())
        ..registerAdapter(QuestionAdapter())
        ..registerAdapter(LevelAdapter())
        ..registerAdapter(CategoryAdapter());
    userBox = await Hive.openBox<UserData>('user');
    questionsBox = await Hive.openBox<Question>('questions');
    levelsBox = await Hive.openBox<Level>('levels');
    categoriesBox = await Hive.openBox<Category>('categories');
    await userBox.clear();
    print("Hive init");
  }
  UserData getUser() => userBox.get('user') ?? UserData();

  Future<void> addNewUserToBox() async {
    final newUser = UserData(init: true,level: 1);
    await _instance.userBox.put('user', newUser);
    print("Added a user");
  }

  void setUsername (String username) async{
    UserData _usr=_instance.getUser();
    _usr.nickname=username;
    await _usr.save();
  }
  void printUser(){
    UserData _usr=_instance.getUser();
    print('User: '+_usr.nickname+' id: '+_usr.id.toString()+' level: '+_usr.level.toString()+' version: '+_usr.version.toString());
  }

}