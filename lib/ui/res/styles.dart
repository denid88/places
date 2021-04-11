import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';

/*
* Styles sets
*/
const LinearGradient baseBackgroundLinear = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    yellow,
    green
  ],
);
/*
* Card Styles
*/
BorderRadius cardBorderRadius = BorderRadius.circular(16.0);
BorderRadius cardTopBorderRadius = BorderRadius.only(
  topRight: Radius.circular(16.0),
  topLeft: Radius.circular(16.0),
);
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
const BoxDecoration borderBottom = BoxDecoration(
  border: Border(
    bottom: BorderSide(
      color: hr,
      width: 1.0,
    ),
  ),
);