
import 'package:flutter/material.dart';
import 'package:how_smart_are_you/models/hive/user.dart';
import 'package:how_smart_are_you/pages/home/categoryController.dart';
import 'package:how_smart_are_you/pages/home/categoryTile.dart';
import 'package:how_smart_are_you/services/HiveServices.dart';
import 'package:how_smart_are_you/services/WidgetService.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    checkData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetService().getAppbar(context),
      body: SafeArea(
        child: Scrollbar(
          thickness: 10,
          showTrackOnHover: true,
          child: SingleChildScrollView(
            child: Column(
              children: HiveServices().getAllCategories()
                .map((category) => CategoryController(cat: category,
              )).toList(),
          ),

    ),
        ),
      ),
    );
  }
}
Future<void> checkData() async{
  await HiveServices().checkData();
  UserData usr = HiveServices().getUser();
  usr.exp = 150;
  await usr.save();
  print(usr.exp);
}
