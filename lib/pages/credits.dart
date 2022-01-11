import 'package:flutter/material.dart';
import 'package:how_smart_are_you/pages/register.dart';
import 'package:how_smart_are_you/services/HiveServices.dart';
import 'package:how_smart_are_you/services/WidgetService.dart';

class Credits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetService().getAppbar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "\n\nThis app was completely made by Cubitchi Alexander and Rapciuc Lorin"
                " for the mobile application project at MSA.",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'PlayfairDisplay'
            ),
          ),

        ],
      ),
    );
  }
}
