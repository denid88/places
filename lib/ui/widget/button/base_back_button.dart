import 'package:flutter/material.dart';

class BaseBackButton extends StatelessWidget {

  final double size;
  final double iconSize;
  final double radius;

  const BaseBackButton({
    this.size = 32.0,
    this.iconSize = 14.0,
    this.radius = 10.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Theme.of(context).backgroundColor,
      ),
      width: size,
      height: size,
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, size: iconSize),
        ),
      )
    );
  }
}
