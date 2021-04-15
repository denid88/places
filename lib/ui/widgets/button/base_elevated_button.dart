import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/styles.dart';

class BaseElevatedButton extends StatelessWidget {

  final dynamic action;
  final String text;
  final FontWeight textFontWeight;
  final bool textIsUppercase;
  final String icon;
  final double iconSize;
  final double width;
  final double height;
  final double topOffset;
  final double bottomOffset;
  final double borderRadius;
  final Color backgroundColor;
  final LinearGradient backgroundGradient;
  final bool gradientEnable;

  const BaseElevatedButton({
    required this.action,
    required this.text,
    this.textFontWeight = FontWeight.w700,
    this.textIsUppercase = false,
    this.icon = '',
    this.iconSize = 20.0,
    this.width = 360.0,
    this.height = 48.0,
    this.topOffset = 0.0,
    this.bottomOffset = 0.0,
    this.borderRadius = elButtonBorderRadius,
    this.backgroundColor = green,
    this.backgroundGradient = baseBackgroundLinear,
    this.gradientEnable = false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topOffset, bottom: bottomOffset),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: height,
          maxWidth: width,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: gradientEnable ? backgroundGradient : null
          ),
          child: ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              backgroundColor: gradientEnable ?
                MaterialStateProperty.all<Color>(Colors.transparent) :
                MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return green.withOpacity(0.56);
                  else if (states.contains(MaterialState.disabled))
                    return lightGrey;
                  return green; // Use the component's default.
                },
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
            onPressed: action,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon.isNotEmpty ?
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      icon,
                      width: iconSize,
                      color: white
                    ),
                  ) : SizedBox.shrink(),
                Text(
                  textIsUppercase ? text.toUpperCase() : text,
                  style: TextStyle(
                    color: action != null ? white : lightGreyWithOpacity56,
                    fontWeight: textFontWeight,
                    letterSpacing: .75
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
