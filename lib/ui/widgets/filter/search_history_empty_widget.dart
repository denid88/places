import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';

class SearchHistoryEmptyWidget extends StatelessWidget {

  static const title = 'Вы еще ничего не нашли';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              searchIconURL,
              width: 35.0,
              height: 35.0,
              color: lightGreyWithOpacity56,
            ),
            SizedBox(height: 20.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                color: lightGreyWithOpacity56,
              ),
            )
          ],
        ),
      ),
    );
  }
}
