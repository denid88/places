import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/colors.dart';

class BaseTextButton extends StatelessWidget {

  static const MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.center;

  final Function action;
  final String text;
  final bool disabled;
  final double width;
  final double height;
  final double topOffset;
  final double bottomOffset;
  final String icon;
  final double iconSize;
  final Color color;
  final FontWeight fontWeight;

  const BaseTextButton({
    required this.action,
    required this.text,
    this.disabled = false,
    this.width = 360.0,
    this.height = 48.0,
    this.topOffset = 0.0,
    this.bottomOffset = 0.0,
    this.icon = '',
    this.iconSize = 20.0,
    this.color = Colors.transparent,
    this.fontWeight = FontWeight.w400
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
          child: TextButton(
            style: Theme.of(context).textButtonTheme.style,
            onPressed: !disabled ? () => action() : null,
            child: disabled ?
              Row(
                mainAxisAlignment: _mainAxisAlignment,
                children: [
                  icon.isNotEmpty ?
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      icon,
                      width: iconSize,
                      color: lightGreyWithOpacity56
                    ),
                  ) : SizedBox.shrink(),
                  Text(text)
                ],
              ) :
              Row(
                mainAxisAlignment: _mainAxisAlignment,
                children: [
                  icon.isNotEmpty ?
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      icon,
                      width: iconSize,
                      color: color == Colors.transparent ?
                        Theme.of(context).brightness == Brightness.light ?
                        grey : white : color
                    ),
                  ) : SizedBox.shrink(),
                  Text(
                    text,
                    style: TextStyle(color: color == Colors.transparent ?
                      Theme.of(context).brightness == Brightness.light ?
                        grey : white : color,
                      fontWeight: fontWeight
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}
