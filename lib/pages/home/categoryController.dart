import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:how_smart_are_you/models/hive/category.dart';
import 'package:how_smart_are_you/models/hive/level.dart';
import 'package:how_smart_are_you/pages/home/categoryTile.dart';
import 'package:how_smart_are_you/pages/home/level_list.dart';
import 'package:how_smart_are_you/services/HiveServices.dart';
class CategoryController extends StatefulWidget {
  final Category cat;

  CategoryController({
      required this.cat,
      });

  @override
  State<CategoryController> createState() => _CategoryControllerState();
}

class _CategoryControllerState extends State<CategoryController> {
  bool _isExpandable = false;

  Widget? _trailing = Icon(Icons.lock);

  void _checkExpandable(){
    var userXP=HiveServices().getUser().exp;
    for(Level x in widget.cat.levels.cast())
      {
        if(x.expRequired <= userXP){
          _isExpandable = true;
          _trailing= Icon(Icons.arrow_drop_down);
          if(widget.cat.completed) _trailing=Icon(Icons.check);
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
            cat: widget.cat,
            trailing: _trailing,
            disabled: false,
          ),
        ),
        expanded: Column(
          children: [
            ExpandableButton(
              child: CategoryTile(
                cat: widget.cat,
                trailing: Icon(Icons.arrow_drop_up),
                disabled: false,
              ),
            ),
            ScrollOnExpand(
                child: LevelList(levels: widget.cat.levels.cast(),)),
            // <-- Collapses when tapped on
          ],
        ),
      ),
    )
        : CategoryTile(
      cat: widget.cat,
      trailing: _trailing,
      disabled: true,
    );
  }
}
