import 'package:flutter/material.dart';
import 'package:mysql_utils/mysql_utils.dart';

 void main (
    )  {
  initDB();
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
   final db = MysqlUtils(
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
        });
   //     var row = await db
   //     .query('select * from Username where id=?', [1]);
   // print(row);
  }
