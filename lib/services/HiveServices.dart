
import 'package:hive/hive.dart';
import 'package:how_smart_are_you/models/hive/category.dart';
import 'package:how_smart_are_you/models/hive/level.dart';
import 'package:how_smart_are_you/models/hive/question.dart';
import 'package:how_smart_are_you/models/hive/user.dart';

class HiveServices{
  late final Box<UserData> user;
  late final Box<Question> questions;
  late final Box<Level> levels;
  late final Box<Category> categories;

  static final HiveServices _instance = HiveServices._internal();

  factory HiveServices() => _instance;

  HiveServices._internal();
  Future<void> initHive() async {
    Hive
        ..registerAdapter(UserDataAdapter())
        ..registerAdapter(QuestionAdapter())
        ..registerAdapter(LevelAdapter())
        ..registerAdapter(CategoryAdapter());
    user = await Hive.openBox<UserData>('user');
    questions = await Hive.openBox<Question>('questions');
    levels = await Hive.openBox<Level>('levels');
    categories = await Hive.openBox<Category>('categories');
  }

}