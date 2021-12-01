

import 'package:flutter/material.dart';
import 'package:how_smart_are_you/models/hive/category.dart';
import 'package:how_smart_are_you/services/ui.dart';

class CategoryTile extends StatelessWidget {
  final Category cat;
  final bool disabled;
  final Widget? trailing;
  CategoryTile({
    required this.cat,
    this.trailing,
    this.disabled = false,
});

  @override
  Widget build(BuildContext context) {
    final Color bgColor=(this.disabled ?  AppColors.GreyLight300 : AppColors.RedLight);
    final Color textColor=(this.disabled ? AppColors.Grey : AppColors.Blue);
    final double opacity = (this.disabled ? 0.9 : 1.0);
    return Opacity(
      opacity: opacity,
      child: Container(
        margin: EdgeInsets.all(AppMargins.General),
        height: 100,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Card(
          elevation: 0,
          color: bgColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppMargins.General,
                      horizontal: AppMargins.Secondary),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cat.title,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                  fontSize: AppFontSizes.XXL,
                                )),
                            Text(
                              cat.description,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: textColor,
                                fontSize: AppFontSizes.M,
                              ),
                            )
                          ],
                        ),
                      ),
                      trailing ?? Container(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
