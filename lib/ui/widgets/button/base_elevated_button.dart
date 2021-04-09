import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/colors.dart';

class BaseElevatedButton extends StatelessWidget {

  final Function action;
  final String text;
  final bool textIsUppercase;
  final String icon;
  final double iconSize;
  final double width;
  final double height;
  final double topOffset;
  final double bottomOffset;

  const BaseElevatedButton({
    required this.action,
    required this.text,
    this.textIsUppercase = false,
    this.icon = '',
    this.iconSize = 20.0,
    this.width = 360.0,
    this.height = 48.0,
    this.topOffset = 0.0,
    this.bottomOffset = 0.0
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
          child: ElevatedButton(
            onPressed: () => action(),
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
                  style: TextStyle(color: white)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
