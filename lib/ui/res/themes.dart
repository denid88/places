import 'package:flutter/material.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: white,
  backgroundColor: Colors.white,
  brightness: Brightness.light,
  textTheme: TextTheme(
    headline1: ltTextBold32,
    headline2: ltTextBold24,
    headline3: ltTextMedium18,
    headline4: ltTextBold14,
    subtitle1: ltTextMedium16,
    subtitle2: ltTextMedium14,
    bodyText1: ltTextRegular16,
    bodyText2: ltTextRegular14
  ),
  accentColor: green,
  dividerColor: hr,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: ltBackgroundColor,
    iconTheme: IconThemeData(
      color: grey
    )
  ),
  tabBarTheme: TabBarTheme(
    labelColor: white,
    unselectedLabelColor: ltTabBarNonActiveColor,
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(
        visitingScreenTabsBorderRadius
      ), // Creates border
      color: dark
    ),
  ),
  cardTheme: CardTheme(
    color: ltCardBackground
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: white,
    elevation: 0.0,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: darkGrey,
    unselectedItemColor: grey
  )
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: dtBackgroundColor,
  backgroundColor: dtBackgroundColor,
  brightness: Brightness.dark,
  textTheme: TextTheme(
    headline1: dtTextBold32,
    headline2: dtTextBold24,
    headline3: dtTextMedium18,
    headline4: dtTextBold14,
    subtitle1: dtTextMedium16,
    subtitle2: dtTextMedium14,
    bodyText1: dtTextRegular16,
    bodyText2: dtTextRegular14
  ),
  accentColor: lightGreen,
  dividerColor: hr,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: dtBackgroundColor,
    iconTheme: IconThemeData(
      color: white
    )
  ),
  tabBarTheme: TabBarTheme(
    labelColor: grey,
    unselectedLabelColor: ltTabBarNonActiveColor,
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(
        visitingScreenTabsBorderRadius
      ), // Creates border
      color: white
    ),
  ),
  cardTheme: CardTheme(
    color: dtCardBackground
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: dtBackgroundColor,
    elevation: 0.0,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: white,
    unselectedItemColor: lightGrey
  )
);
