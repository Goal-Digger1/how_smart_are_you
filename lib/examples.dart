

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:how_smart_are_you/models/hive/user.dart';

class Examples{
  //open box anywhere in the code
  final Box user = Hive.box<UserData>('user');

  //in box sunt salvate obiectele ca [index_intern,key_custom,obiect] in box
  void test(){
    //get users in a box
   for (UserData element in user.values){
     print(element.nickname);
    }

   //iterate thru all users is custom keys
   for ( var i = 0;i<user.length;i++)
     print(user.getAt(i));

   user.add(UserData()); //index intern si key vor fi egale

   user.put('indexul nostru',UserData()); //se si sorteaza crescator dupa index
   // fie lexycografic daca ii string sau crescator la int

   user.getAt(0); // ia primul element in box care e ori ordonat dupa si e mereu de la 0->box.lenght
   print(user.get('John')); //get('nickname') in functie de ce index salvam la fiecare obiect
    // de exemplu poate if id sau nickname de la user
    //gen Primary key pe care il alegem noi cand salvam din SQL in Hive
  }

//trigger on update
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo User exist',
      home: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: user.listenable(),
          builder: (context, box, widget) {
            return Center(
              child: Switch(
                value: user.isEmpty  ,
                onChanged: (val) {

                },
              ),
            );
          },
        ),
      ),
    );
  }

}
