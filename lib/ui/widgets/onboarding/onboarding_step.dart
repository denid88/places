import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/colors.dart';

class OnBoardingStep extends StatelessWidget {

  final String image;
  final String title;
  final String description;

  const OnBoardingStep({
    required this.image,
    required this.title,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 244.0
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              color: Theme.of(context).brightness == Brightness.light ?
                lowBlack : white,
            ),
            SizedBox(height: 40.0),
            Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Theme.of(context).brightness == Brightness.light ?
                    lowBlack : white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 14.0,
                color: lightGrey2
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
