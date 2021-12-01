
import 'package:flutter/material.dart';
import 'package:how_smart_are_you/models/hive/user.dart';
import 'package:how_smart_are_you/pages/home/categoryController.dart';
import 'package:how_smart_are_you/pages/home/categoryTile.dart';
import 'package:how_smart_are_you/services/HiveServices.dart';
import 'package:how_smart_are_you/services/WidgetService.dart';
import 'package:how_smart_are_you/services/ui.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
    return Scaffold(
      appBar: WidgetService().getAppbar(context),
      body: SafeArea(
        child: Scrollbar(
          thickness: 10,
          showTrackOnHover: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 150,
                  padding: EdgeInsets.symmetric(horizontal: AppMargins.General),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.deepOrangeAccent,
                        child: Text(
                          HiveServices().getUser().nickname,
                          style: TextStyle(
                            fontSize: AppFontSizes.XL,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(AppMargins.Secondary),
                              child: LinearPercentIndicator(
                                lineHeight: 25,
                                width: MediaQuery.of(context).size.width-200,
                                percent: ((HiveServices().getUser().exp % 100)/100),
                                backgroundColor: AppColors.BlueLight,
                                progressColor: Colors.tealAccent[400],
                                center: Text(
                                    "Level: "+(HiveServices().getUser().exp/100).floor().toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppFontSizes.S,
                                    ),
                                ),
                              ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  children: HiveServices().getAllCategories()
                    .map((category) => CategoryController(cat: category,
                  )).toList(),
          ),
              ],
            ),

    ),
        ),
      ),
    );
  }
}
Future<void> checkData() async{
  await HiveServices().checkData();
}
