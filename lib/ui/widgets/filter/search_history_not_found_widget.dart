import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';

class SearchHistoryNotFoundWidget extends StatelessWidget {

  static const String title = 'Ничего не найдено';
  static const String description = 'Попробуйте изменить параметры поиска';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              searchIconURL, width: 50.0, height: 50.0,
              color: lightGreyWithOpacity56,
            ),
            SizedBox(height: 32.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                color: lightGreyWithOpacity56,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
                color: lightGreyWithOpacity56,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
