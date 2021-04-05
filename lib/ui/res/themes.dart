import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/colors.dart';

ThemeData theme = ThemeData(
  backgroundColor: Colors.white,
  textTheme: TextTheme(
    headline1: textBold32,
    headline2: textBold24,
    headline3: textMedium18,
    headline4: textBold14,
    subtitle1: textMedium16,
    subtitle2: textMedium14,
    bodyText1: textRegular16,
    bodyText2: textRegular14
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: backgroundColor
  )
);
