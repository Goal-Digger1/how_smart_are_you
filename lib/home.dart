import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DropDown Button Example - FlutterCorner",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("DropDown Button Example - FlutterCorner"),
          backgroundColor: Colors.black,
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _animals = ["Level 1", "Level 2", "Level 3", "Level 4"];

  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5)),
          child: DropdownButton<String>(
            onChanged: (value) {
              setState(() {
                _selectedColor = value;
              });
            },
            value: _selectedColor,

            // Hide the default underline
            underline: Container(),
            hint: Center(
                child: Text(
                  'Category 1',
                  style: TextStyle(color: Colors.black),
                )),
            icon: Icon(
              Icons.arrow_downward,
              color: Colors.black,
            ),
            isExpanded: true,

            // The list of options
            items: _animals
                .map((e) => DropdownMenuItem(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  e,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              value: e,
            ))
                .toList(),

            // Customize the selected item
            selectedItemBuilder: (BuildContext context) => _animals
                .map((e) => Center(
              child: Text(
                e,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
