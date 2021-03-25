import 'package:flutter/painting.dart';
import 'colors.dart';

/*
* Text styles
*/
TextStyle _text = const TextStyle(
  fontStyle: FontStyle.normal,
  color: textPrimaryColor,
  fontFamily: 'Roboto'),

//Regular
  textRegular = _text.copyWith(fontWeight: FontWeight.w400),

//Medium
  textMedium = _text.copyWith(fontWeight: FontWeight.w500),

//Bold
  textBold = _text.copyWith(fontWeight: FontWeight.w700),
  textBold32 = textBold.copyWith(fontSize: 32.0, height: 1.125);
