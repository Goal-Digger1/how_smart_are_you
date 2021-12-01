import 'package:flutter/material.dart';
import 'package:how_smart_are_you/pages/credits.dart';
import 'package:how_smart_are_you/pages/home/home.dart';
class WidgetService{
  static final WidgetService _instance = WidgetService._internal();
  factory WidgetService() => _instance;
  WidgetService._internal();

  AppBar getAppbar(BuildContext context){
    return AppBar(
      centerTitle: true,
      toolbarHeight: 55,
      backgroundColor: Colors.white,
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
                      onPressed: (){
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Credits()));},
                      icon: Icon(Icons.alternate_email,
                      color: Colors.black,))
              ),
              Text('Credits',
              style: TextStyle(
                color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PlayfairDisplay'
              ),)
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
                icon: Icon(Icons.home,
                color: Colors.black,),),
            ),
            Text('Home',
            style: TextStyle(
              color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'PlayfairDisplay'
            ))
          ],
        ),
      ),
      title: Column(
        children: [
          Image(
            image: AssetImage('images/mainIcon.jpg'),
            height: 35,
            width: 35,
          ),
          Text(
            "How smart are you?",
            style: TextStyle(
              color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'PlayfairDisplay'
            ),
          ),
        ],
      ),
    );
  }
}