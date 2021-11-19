import 'package:flutter/material.dart';
import 'package:how_smart_are_you/models/hive/level.dart';
import 'package:how_smart_are_you/pages/home/level_tile.dart';
import 'package:how_smart_are_you/services/ui.dart';
class LevelList extends StatelessWidget {
  final List<Level> levels;

  LevelList({
    required this.levels
});


  @override
  Widget build(BuildContext context) {
    int _index = 1;
    return Container(
      margin: EdgeInsets.only(left: AppMargins.General, right: AppMargins.General),
      child: Column(
          children: this.levels.map((level)
            => LevelTile(
              level: level,
              index: _index++,
            )
          ).toList()),
    );
  }
}

