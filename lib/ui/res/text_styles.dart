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
  textRegular16 = textRegular.copyWith(fontSize: 16.0, color: grey, height: 1.125),
  textRegular14 = textRegular.copyWith(fontSize: 14.0, color: cardDescription),
  textRegular14Light = textRegular.copyWith(fontSize: 14.0, color: empty),

//Medium
  textMedium = _text.copyWith(fontWeight: FontWeight.w500),
  textMedium16 = textMedium.copyWith(fontSize: 16.0, color: grey),
  textMedium14 = textMedium.copyWith(fontSize: 14.0),
  textMedium18 = textMedium.copyWith(fontSize: 18.0, color: grey),
  textMedium18Light = textMedium.copyWith(fontSize: 18.0, color: empty),

//Bold
  textBold = _text.copyWith(fontWeight: FontWeight.w700),
  textBold14 = textBold.copyWith(fontSize: 14.0, color: grey),
  textBold24 = textBold.copyWith(fontSize: 24.0, color: grey),
  textBold32 = textBold.copyWith(fontSize: 32.0, height: 1.125);
