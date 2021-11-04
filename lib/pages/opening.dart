import 'package:flutter/material.dart';
import 'package:how_smart_are_you/pages/register.dart';
import 'package:how_smart_are_you/services/HiveServices.dart';

class Opening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image(
            image: AssetImage('images/mainIcon.jpg'),
          ),
          Text(
            "How smart are you?",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'PlayfairDisplay'
            ),
          ),
          Container(
            height: 80.0,
            width: 250.0,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Register()));
                },
                child: const Text(
                  'Register to find out',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                )
            ),
          ),
        ],
      ),
    );
  }
}
