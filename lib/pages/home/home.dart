
import 'package:flutter/material.dart';
import 'package:how_smart_are_you/pages/home/categoryController.dart';
import 'package:how_smart_are_you/pages/home/categoryTile.dart';
import 'package:how_smart_are_you/services/HiveServices.dart';

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
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 8, 0),
            child: Column(
            children: [
              Icon(Icons.settings),
              Text("Settings")
            ],
        ),
          )],
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Column(
              children: [
                Icon(Icons.home),
                Text('Home')
              ],
            ),
          ),
        ),
        title: Column(
          children: [
            Text(
              "How smart are you?",
              style: TextStyle(
                fontSize: 16
              ),
            ),
          ],
        ),
      ),
    body: SingleChildScrollView(
      child: Column(
        children: HiveServices().getAllCategories()
            .map((category) => CategoryController(cat: category,
        )).toList(),
      ),

    ),
    );
  }
}
Future<void> checkData() async{
  await HiveServices().checkData();
}
