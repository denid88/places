import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';

class OnBoardingIndicator extends StatelessWidget {

  final int active;

  const OnBoardingIndicator({
    this.active = 0
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 88.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(3, (index) {
            if (index == active) {
              return Container(
                width: 24.0,
                height: 8.0,
                margin: const EdgeInsets.only(right: 8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(8.0)
                ),
              );
            }
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightGreyWithOpacity56
              ),
            );
          }),
        ),
      ),
    );
  }
}
