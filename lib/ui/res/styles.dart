import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';

/*
* Styles sets
*/

/*
* Filter TextField Styles
*/

OutlineInputBorder defaultBorderStyle = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.transparent,
  ),
  borderRadius: BorderRadius.circular(12.0)
);

/*
* Settings Items Styles
*/
BoxDecoration borderBottom = BoxDecoration(
  border: Border(
    bottom: BorderSide(
      color: hr,
      width: 1.0,
    ),
  ),
);