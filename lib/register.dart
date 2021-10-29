import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'images/mainIcon.jpg',
            height: 300,
            width: 300
          ),

          Form(
            child: Column(
              children: <Widget>[
                Text(
                  "Nickname",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PlayfairDisplay'
                  ),
                ),
                SizedBox(height: 10.0,width: 10.0),
                TextFormField(

              ),
              ]
            ),
          ),
          Container(
            height: 80.0,
            width: 120.0,
            child: ElevatedButton(
                onPressed: () {  },
                child: const Text(
                  'Enter',
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
