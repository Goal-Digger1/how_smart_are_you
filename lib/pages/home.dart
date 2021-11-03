
import 'package:flutter/material.dart';
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
    return Container();
  }
}
Future<void> checkData() async{
  await HiveServices().checkData();

}
