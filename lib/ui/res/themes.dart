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
    elevation: noElevation,
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
    color: ltCardBackground,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    elevation: noElevation
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: white,
    elevation: noElevation,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: darkGrey,
    unselectedItemColor: grey
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(green),
      elevation: MaterialStateProperty.all<double>(noElevation),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(elButtonBorderRadius),
        ),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all<Color>(greenWithOpacity50),
      textStyle: MaterialStateProperty.all<TextStyle>(
        ltTextRegular14.copyWith(color: lightGreyWithOpacity56)
      ),
    ),
  ),
  sliderTheme: SliderThemeData(
    trackHeight: 2.0,
    thumbColor: white,
    activeTrackColor: green,
    overlayColor: lightGreenWithOpacity50,
    inactiveTrackColor: lightGreyWithOpacity56,
    rangeTrackShape: RectangularRangeSliderTrackShape(),
    rangeThumbShape: RoundRangeSliderThumbShape(
      enabledThumbRadius: 8.0,
      elevation: 2.0,
    ),
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
    elevation: noElevation,
    backgroundColor: dtBackgroundColor,
    iconTheme: IconThemeData(
      color: white
    ),
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
    color: dtCardBackground,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    elevation: noElevation
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: dtBackgroundColor,
    elevation: noElevation,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: white,
    unselectedItemColor: lightGrey
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(lightGreen),
      elevation: MaterialStateProperty.all<double>(noElevation),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(elButtonBorderRadius),
        ),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all<Color>(lightGreenWithOpacity50),
      textStyle: MaterialStateProperty.all<TextStyle>(
        dtTextRegular14.copyWith(color: lightGreyWithOpacity56)
      ),
    ),
  ),
  sliderTheme: SliderThemeData(
    trackHeight: 2.0,
    thumbColor: white,
    activeTrackColor: lightGreen,
    overlayColor: lightGreenWithOpacity50,
    inactiveTrackColor: lightGreyWithOpacity56,
    rangeTrackShape: RectangularRangeSliderTrackShape(),
    rangeThumbShape: RoundRangeSliderThumbShape(
      enabledThumbRadius: 8.0,
      elevation: 2.0,
    ),
  ),
);
