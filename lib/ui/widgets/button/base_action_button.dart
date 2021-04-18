import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/colors.dart';

class BaseActionButton extends StatelessWidget {

  final String icon;
  final Function? action;
  final double size;
  final Color color;

  const BaseActionButton({
    required this.icon,
    required this.action,
    this.size = 20.0,
    this.color = Colors.white
  }) : assert(action != null, 'Probably you forgot to add action!!!');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => action!(),
      child: Container(
        width: size,
        height: size,
        child: icon.isNotEmpty ? SvgPicture.asset(
          icon,
          color: color,
        ) : SizedBox.shrink(),
      ),
    );
  }
}
