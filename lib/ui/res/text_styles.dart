import 'package:flutter/painting.dart';
import 'package:places/ui/res/colors.dart';

/*
* Text styles
*/
TextStyle _text = const TextStyle(
  fontStyle: FontStyle.normal,
  color: ltTextPrimaryColor,
  fontFamily: 'Roboto'
);
/*
* Regular
*/
final textRegular = _text.copyWith(fontWeight: FontWeight.w400);
final ltTextRegular16 = textRegular.copyWith(fontSize: 16.0, color: grey, height: 1.125);
final dtTextRegular16 = ltTextRegular16.copyWith(color: white);
final ltTextRegular14 = textRegular.copyWith(fontSize: 14.0, color: ltCardDescription);
final dtTextRegular14 = ltTextRegular14.copyWith(color: dtCardDescription);
final ltTextRegular14Light = textRegular.copyWith(fontSize: 14.0, color: ltEmpty);
/*
* Medium
*/
final textMedium = _text.copyWith(fontWeight: FontWeight.w500);
final ltTextMedium16 = textMedium.copyWith(fontSize: 16.0, color: grey);
final dtTextMedium16 = ltTextMedium16.copyWith(color: white);
final ltTextMedium14 = textMedium.copyWith(fontSize: 14.0);
final dtTextMedium14 = ltTextMedium14.copyWith(color: white);
final ltTextMedium18 = textMedium.copyWith(fontSize: 18.0, color: grey);
final dtTextMedium18 = ltTextMedium18.copyWith(color: white);
final ltTextMedium18Light = textMedium.copyWith(fontSize: 18.0, color: ltEmpty);
/*
* Bold
*/
final textBold = _text.copyWith(fontWeight: FontWeight.w700);
final ltTextBold14 = textBold.copyWith(fontSize: 14.0, color: grey);
final dtTextBold14 = ltTextBold14.copyWith(color: white);
final ltTextBold24 = textBold.copyWith(fontSize: 24.0, color: grey);
final dtTextBold24 = ltTextBold24.copyWith(color: white);
final ltTextBold32 = textBold.copyWith(fontSize: 32.0, height: 1.125);
final dtTextBold32 = ltTextBold32.copyWith(color: white);
