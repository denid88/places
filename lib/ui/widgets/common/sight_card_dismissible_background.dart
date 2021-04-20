import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/styles.dart';

class SightCardDismissibleBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: cardBorderRadius,
        color: white,
      )
    );
  }
}
