import 'package:flutter/material.dart';
import 'package:how_smart_are_you/pages/home/home.dart';
class WidgetService{
  static final WidgetService _instance = WidgetService._internal();
  factory WidgetService() => _instance;
  WidgetService._internal();

  AppBar getAppbar(BuildContext context){
    return AppBar(
      centerTitle: true,
      toolbarHeight: 50,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 6, 6),
          child: Column(
            children: [
              Expanded(
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                      iconSize: 24,
                      onPressed: (){},
                      icon: Icon(Icons.settings))
              ),
              Text("Settings")
            ],
          ),
        )],
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                iconSize: 24,
                onPressed: (){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Home()));},
                icon: Icon(Icons.home,),),
            ),
            Text('Home')
          ],
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
    );
  }
}