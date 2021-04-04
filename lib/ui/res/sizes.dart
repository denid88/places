import 'package:flutter/material.dart';
/*
* App sizes
*/

/*
* Sight List Screen
*/
const double sightListScreenAppBarMobileH = 112.0,
      sightListScreenAppBarWebH = 130.0;
const EdgeInsets sightListScreenAppBarPadding =
      EdgeInsets.only(left: 16.0, right: 16.0, top: 40.0, bottom: 16.0),
      sightListScreenContainerPadding = _containerPaddingH16;

/*
* Visiting Screen
*/
const double visitingScreenAppBarH = 56.0,
     visitingScreenTabsBorderRadius = 40.0,
     visitingScreenTabsH = 40.0;

const EdgeInsets visitingScreenContainerPadding = _containerPaddingAll16,
    visitingScreenMarginTabs = _marginThreeSides16;

/*
* Bottom Navigation Bar
*/
const double bottomNavigationBarBorderWidth = 1.0,
      bottomNavigationBarMinHeight = 56.0;

const _containerPaddingH16 = EdgeInsets.symmetric(horizontal: 16.0),
      _containerPaddingAll16 = EdgeInsets.all(16.0),
      _marginThreeSides16 = EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0);