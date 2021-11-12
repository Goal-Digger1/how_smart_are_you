import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:how_smart_are_you/models/hive/category.dart';
import 'package:how_smart_are_you/models/hive/level.dart';
import 'package:how_smart_are_you/pages/home/categoryTile.dart';
import 'package:how_smart_are_you/services/HiveServices.dart';
class CategoryController extends StatelessWidget {
  bool _isExpandable = false;

  final Category cat;
  Widget? _trailing = Icon(Icons.lock);
  CategoryController({
      required this.cat,
      });
  void _checkExpandable(){
    var userXP=HiveServices().getUser().exp;
    for(Level x in cat.levels.cast())
      {
        if(x.expRequired <= userXP){
          _isExpandable = true;
          _trailing= Icon(Icons.list);
          if(cat.completed) _trailing=Icon(Icons.check);
          break;
        }
      }
  }
  @override
  Widget build(BuildContext context) {
    _checkExpandable();
    return _isExpandable
        ? ExpandableNotifier(
      child: Expandable(
        collapsed: ExpandableButton(
          child: CategoryTile(
            cat: cat,
            trailing: _trailing,
            disabled: false,
          ),
        ),
        expanded: Column(
          children: [
            ExpandableButton(
              child: CategoryTile(
                cat: cat,
                trailing: _trailing,
                disabled: false,
              ),
            ),
              Container(
                height: 70,
                width: 50,
                color: Colors.orange,
              )
            // <-- Collapses when tapped on
          ],
        ),
      ),
    )
        : CategoryTile(
      cat: cat,
      trailing: _trailing,
      disabled: true,
    );
  }
}
