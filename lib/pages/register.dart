import 'package:flutter/material.dart';
import 'package:how_smart_are_you/pages/home.dart';
import 'package:how_smart_are_you/services/HiveServices.dart';
class Register extends StatefulWidget {


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String _value = '';
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
            key: _formKey,
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
                    validator: (value){
                      _value=value ?? '';
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      //TODO: check for unique in DB
                      return null;
                    },
                  ),
                ]
            ),
          ),
          Container(
            height: 80.0,
            width: 120.0,
            child: ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    HiveServices().setUsername(_value);
                    HiveServices().printUser();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  }
                },
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