import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screens/filter_screen.dart';
import 'package:places/ui/screens/sight_search_screen.dart';
import 'package:places/ui/widgets/common/middleware_bar.dart';

class SearchBar extends StatefulWidget {

  final bool disabled;
  final String suffixIcon;
  final Color suffixIconColor;
  final double suffixSize;
  final dynamic suffixIconAction;

  const SearchBar({
    this.disabled = false,
    this.suffixIcon = '',
    this.suffixSize = 18.0,
    this.suffixIconColor = Colors.transparent,
    this.suffixIconAction
  });

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6.0, bottom: 14.0),
      height: 40.0,
      constraints: BoxConstraints(
        maxWidth: 768.0,
      ),
      width: double.infinity,
      child: MiddleWareBar(
        action: () {
          print('middleware');
        },
        middlewareValue: widget.disabled,
        widget: TextField(
          readOnly: widget.disabled,
          style: ltTextRegular16,
          decoration: InputDecoration(
            prefixIcon: Container(
              margin: const EdgeInsets.only(left: 15.0, right: 14.0),
              child: SvgPicture.asset(
                searchIconURL,
                width: 20.0,
                color: lightGreyWithOpacity56,
              ),
            ),
            suffixIcon: widget.suffixIcon.isNotEmpty ? InkWell(
              onTap: widget.suffixIconAction,
              child: Container(
                margin: const EdgeInsets.only(right: 15.0),
                child: SvgPicture.asset(
                  widget.suffixIcon,
                  width: widget.suffixSize,
                  color: widget.suffixIconColor,
                ),
              ),
            ) : null,
            suffixIconConstraints: BoxConstraints(
                minWidth: 20.0
            ),
            contentPadding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              left: 48.0,
              right: 30.0
            ),
            disabledBorder: defaultBorderStyle,
            enabledBorder: defaultBorderStyle,
            border: defaultBorderStyle,
            focusedBorder: widget.disabled ?
            defaultBorderStyle :
            OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).accentColor,
              ),
              borderRadius: BorderRadius.circular(12.0)
            ),
            filled: true,
            fillColor: Theme.of(context).cardTheme.color,
            focusColor: lightGrey,
            hintText: 'Поиск',
            hintStyle: TextStyle(
              color: lightGreyWithOpacity56
            ),
          ),
        ),
      ),
    );
  }
}

