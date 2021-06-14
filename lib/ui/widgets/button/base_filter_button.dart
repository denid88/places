import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/utils/text_utils.dart';
import 'package:places/ui/utils/icon_utils.dart';
import 'package:places/ui/utils/sizes_utils.dart';

class BaseFilterButton extends StatelessWidget {

  final String type;
  final Function action;
  final bool status;

  const BaseFilterButton({
    required this.type,
    required this.action,
    this.status = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 40.0,
        right: isScreenSmall(MediaQuery.of(context).size) ? 0.0 : 12.0
      ),
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 96.0
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 64.0,
                height: 64.0,
                decoration: const BoxDecoration(
                  color: greenWithOpacity16,
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.only(bottom: 12.0),
                child: InkWell(
                  radius: 64.0,
                  borderRadius: BorderRadius.circular(64.0),
                  splashColor: Theme.of(context).dividerColor,
                  onTap: () => action({
                    'type': type,
                    'status': !status
                  }),
                  child: Center(
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: 30.0
                      ),
                      child: SvgPicture.asset(
                          getIconFromType(type),
                          color: Theme.of(context).accentColor
                      ),
                    ),
                  ),
                )
              ),
              status ? Positioned(
                bottom: 16.0,
                right: 0,
                child: Icon(
                  Icons.check_circle,
                  color: Theme.of(context).brightness == Brightness.light ?
                    lowBlack : white,
                  size: 16.0,
                )
              ) : SizedBox.shrink()
            ],
          ),
          type.isNotEmpty ? Text(
            capitalizeFirst(type),
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light ?
              middleBlack : white,
            )
          ) : SizedBox.shrink()
        ],
      ),
    );
  }
}
