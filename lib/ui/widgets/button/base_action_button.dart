import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BaseActionButton extends StatelessWidget {

  final String icon;
  final Function? action;
  final double size;

  const BaseActionButton({
    required this.icon,
    required this.action,
    this.size = 20.0
  }) : assert(action != null, 'Probably you forgot to add action!!!');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => action!(),
      child: Container(
        width: size,
        height: size,
        child: icon.isNotEmpty ? SvgPicture.asset(icon) : SizedBox.shrink(),
      ),
    );
  }
}
