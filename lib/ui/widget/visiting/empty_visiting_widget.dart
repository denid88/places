import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/colors.dart';

class EmptyVisitingWidget extends StatelessWidget {

  static const emptyString = 'Пусто';

  final String emptyImage;
  final String emptyText;

  const EmptyVisitingWidget({
    @required this.emptyImage,
    @required this.emptyText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          emptyImage,
          color: empty
        ),
        SizedBox(height: 30.0),
        Text(
          emptyString,
          style: textMedium18Light,
        ),
        SizedBox(height: 8.0),
        SizedBox(
          width: 230.0,
          child: Text(
            emptyText,
            textAlign: TextAlign.center,
            style: textRegular14Light
          ),
        ),
      ],
    );
  }
}
