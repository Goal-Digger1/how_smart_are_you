import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:how_smart_are_you/models/hive/category.dart';
import 'package:how_smart_are_you/models/hive/level.dart';
import 'package:how_smart_are_you/models/hive/question.dart';
import 'package:how_smart_are_you/services/HiveServices.dart';
import 'package:mysql_utils/mysql_utils.dart';

class Sqlservices {
  bool _status= true ;
  late final MysqlUtils _db;

  static final Sqlservices _instance = Sqlservices._internal();

  factory Sqlservices() => _instance;

  Sqlservices._internal();

  Future<void> initDB() async {
    await dotenv.load(fileName: ".env");

    String _add = dotenv.env['address'] ?? '';
    String? _psw = dotenv.env['password'];
try {
  _db = MysqlUtils(
      settings: ConnectionSettings(
        host: _add,
        port: 3306,
        user: 'admin',
        password: _psw,
        db: 'howsmartareyou',
        useCompression: false,
        useSSL: false,
        timeout: const Duration(seconds: 10),
      ),
      prefix: '',
      pool: true,
      errorLog: (error) {
        _instance._status = false;
        print('|$error\n├───────────────────────────');
      },
      sqlLog: (sql) {
        print('|$sql\n├───────────────────────────');
      },
      connectInit: (db1) async {
        print('Connected to db');
      });
  }catch(E){
  print(E.toString());
  print("IM here");
  }
    //     var row = await db
    //     .query('select * from Username where id=?', [1]);
    // print(row);
  }

  Future<int> getVersion() async {
    if(_instance._status) {
      var row = await _db.query('select max(version) from Data', []);
      return row.first[0];
    }
    else return -1;
  }

  Future<List<Category>> getNewCategories(int vrs) async {
    var rows;

      rows = await _db.query(
          'select id,description,name from Category ',[]);
      List<Category> _list = [];
      for (var row in rows) {
        var _temp = row.toList();
        _list.add(Category(
            id: _temp[0],
            title: _temp[2],
            description: _temp[1]
        ));
      }
      return _list;
    }


  Future<List<Level>> getNewLevels(int vrs) async {
    var rows;

      rows = await _db.query('select id,category_id,xpRequirement from Level '
          'order by category_id ASC',
          []);

    List<Level> _list = [];
    for (var row in rows) {
      var _temp = row.toList();
      _list.add(Level(
          id: _temp[0],
          categoryId: _temp[1],
          expRequired: _temp[2]
      ));
    }
    return _list;
  }

  Future<List<Question>> getNewQuestions(int vrs) async {
    var rows;

      rows = await _db.query('select * from Question order by level_id ASC ',
          []);
    List<Question> _list = [];
    for (var row in rows) {
      var _temp = row.toList();
      _list.add(Question(
          id: _temp[0],
          levelId: _temp[1],
          statement: _temp[2],
          correctAnswer: _temp[3],
          wrongAnswers: [_temp[4], _temp[5], _temp[6]]
      ));
    }
    return _list;
  }
}