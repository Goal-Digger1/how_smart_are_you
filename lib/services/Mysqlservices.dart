import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mysql_utils/mysql_utils.dart';

class Sqlservices{
  late final _db;

  static final Sqlservices _instance = Sqlservices._internal();

  factory Sqlservices() => _instance;

  Sqlservices._internal();

  Future<void> initDB() async {
    await dotenv.load(fileName: ".env");

    String _add=dotenv.env['address'] ?? '';
    String? _psw=dotenv.env['password'];

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
          print('|$error\n├───────────────────────────');
        },
        sqlLog: (sql) {
          print('|$sql\n├───────────────────────────');
        },
        connectInit: (db1) async {
          print('Connected to db');
        });

    //     var row = await db
    //     .query('select * from Username where id=?', [1]);
    // print(row);
  }
}