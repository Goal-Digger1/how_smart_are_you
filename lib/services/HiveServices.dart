
import 'package:hive/hive.dart';
import 'package:how_smart_are_you/models/hive/category.dart';
import 'package:how_smart_are_you/models/hive/level.dart';
import 'package:how_smart_are_you/models/hive/question.dart';
import 'package:how_smart_are_you/models/hive/user.dart';
import 'package:how_smart_are_you/services/Mysqlservices.dart';

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
    print("Hive init");
    // await categoriesBox.clear();
    // await levelsBox.clear();
    // await questionsBox.clear();
    // await userBox.clear();
  }
  UserData getUser() => userBox.get('user') ?? UserData();
  int getUserVersion() => userBox.get('user')!.version;
  Future<bool> checkCat(int catId) async{
      Category cat = categoriesBox.get(catId) ?? Category();
      //print(cat);
      for(Level lvl in cat.levels.cast()){
        if(!lvl.completed) return false;
      }
      cat.updateStatus(true);
      await cat.save();
      return true;
  }
  Future<void> addNewUserToBox() async {
    final newUser = UserData(init: true,level: 1);
    newUser.exp = 100;
    await _instance.userBox.put('user', newUser);
    print("Added a user with" + newUser.exp.toString()+" xp!");
  }
  Future<void> addXp(int n) async{
    UserData _usr=_instance.getUser();
    _usr.exp+=n;
    await _usr.save();
  }
  Future<void> setUsername (String username) async{
    UserData _usr=_instance.getUser();
    _usr.nickname=username;
    await _usr.save();
  }
  void printUser(){
    UserData _usr=_instance.getUser();
    print('User: '+_usr.nickname+' id: '+_usr.id.toString()+' level: '+_usr.level.toString()+' version: '+_usr.version.toString());
  }
  void printAll(){
    print(categoriesBox.values.toString());
  }
  Future<void> checkData() async{
    UserData _usr=_instance.getUser();
     int _dbVersion =await Sqlservices().getVersion();
    print("User:${_usr.version}, Db: $_dbVersion");
    if(_usr.version < _dbVersion){
      {
        await categoriesBox.clear();
        await levelsBox.clear();
        await questionsBox.clear();
        await _instance.importNewData(_dbVersion);
        _usr.version = _dbVersion;
        await _usr.save();
      }

    }
    //HiveServices().printAll();
  }
  Future<void> importNewData(int vrs) async{
    //import from SQL
    List<Category> newCategories = await Sqlservices().getNewCategories(vrs);
    List<Level> newLevels = await Sqlservices().getNewLevels(vrs);
    List<Question> newQuestions = await Sqlservices().getNewQuestions(vrs);
    //add to boxes
    newCategories.forEach((element) {
      categoriesBox.put(element.id, element);
    });
    newLevels.forEach((element) {
      levelsBox.put(element.id, element);
    });
    newQuestions.forEach((element) {
      questionsBox.put(element.id, element);
    });
    //link Hive objects to hivelists
    newCategories.forEach((element) { //add all Levels to the list Category.levels
      element.levels=HiveList(levelsBox);
      newLevels.forEach((element1) {
        if(element1.categoryId == element.id){
          element.levels.add(element1);
        }
      });
    });
    newLevels.forEach((element) { //add all Questions to the list Level.questions
      element.questions=HiveList(questionsBox);
      newQuestions.forEach((element1) {
        if(element1.levelId == element.id){
          element.questions.add(element1);
        }
      });
    });
  }
  List<Category> getAllCategories(){
    return categoriesBox.values.toList();
  }
}