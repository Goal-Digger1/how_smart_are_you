import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:how_smart_are_you/services/HiveServices.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
 void main () async {
   await dotenv.load(fileName: ".env");
   WidgetsFlutterBinding.ensureInitialized();
  initDB();
  initHive();
 runApp(MaterialApp(
    home: Scaffold(
      body: const Center(
        child: Text(
          'How smart are you?',
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'PlayfairDisplay'
          ),
        ),
      ),
    ),
  ));
}
void initDB() async {
   String _add=dotenv.env['address'] ?? '';
   String? _psw=dotenv.env['password'];

   final db = MysqlUtils(
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
          print('whenComplete');
        });
   //     var row = await db
   //     .query('select * from Username where id=?', [1]);
   // print(row);
  }
  void initHive() async {
    await Hive.initFlutter();
    HiveServices().initHive();
  }
