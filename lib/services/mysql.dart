import 'package:mysql_utils/mysql_utils.dart';
import 'package:mysql1/mysql1.dart';
class MySQL{
  late final db;
  late final conn;
  Future<dynamic> connect() async {
     db = MysqlUtils(
        settings: ConnectionSettings(
          host: 'database-1.c5txbcqs9xrv.us-east-2.rds.amazonaws.com',
          port: 3306,
          user: 'admin',
          password: '11223344',
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
        }
    );
     return db;
  }

  MySQL();

}