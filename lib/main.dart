import 'package:flutter/material.dart';
import 'package:how_smart_are_you/pages/home.dart';
import 'package:how_smart_are_you/pages/opening.dart';
import 'package:hive/hive.dart';
import 'package:how_smart_are_you/services/HiveServices.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:how_smart_are_you/services/Mysqlservices.dart';
import 'models/hive/user.dart';
 void main () async {
   WidgetsFlutterBinding.ensureInitialized();
   await Sqlservices().initDB();
   await Hive.initFlutter();
   await HiveServices().initHive();

  runApp(MyApp()) ;
}

  class MyApp extends StatefulWidget {
    @override
    _MyAppState createState() => _MyAppState();
  }

  class _MyAppState extends State<MyApp> {
   @override
  void initState() {
    super.initState();
  }
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: HiveServices().getUser().init ? Home():Opening() ,);
    }
  }

