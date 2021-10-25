import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Opening(),
));

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
            child: FloatingActionButton(
              onPressed: () {  },
              child: const Text(
                'Register to find out',
                //style:
              ),
              shape: BeveledRectangleBorder(),
              backgroundColor: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
