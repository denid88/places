import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';

class ImageControlWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.0,
      height: 72.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          width: 2.0,
          color: greenWithOpacity50
        )
      ),
      margin: const EdgeInsets.only(right: 16.0),
      child: Icon(
        Icons.add,
        color: green,
        size: 32.0,
      ),
    );
  }
}
