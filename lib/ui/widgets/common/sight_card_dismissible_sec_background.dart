import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/styles.dart';

class SightCardDismissibleSecBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: cardBorderRadius,
        color: red,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0, bottom: 10.0),
            child: SvgPicture.asset(
              trashIconURL,
              color: white,
            ),
          ),
          Text(
            'Удалить',
            style: TextStyle(
              color: white
            ),
          )
        ],
      ),
    );
  }
}