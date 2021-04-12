import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/res/text_styles.dart';

class DropdownAddSightInput extends StatelessWidget {

  final Function action;
  final String label;
  final String hint;

  const DropdownAddSightInput({
    required this.action,
    required this.label,
    this.hint = 'Не выбрано'
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              label.toUpperCase(),
              style: baseLabelStyle
            )
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 24.0),
            child: TextField(
              onTap: () => action(),
              style: ltTextRegular16,
              readOnly: true,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.arrow_forward_ios,
                  color: darkGrey,
                  size: 16.0,
                ),
                contentPadding: EdgeInsets.only(
                  top: 16.0,
                  bottom: 4.0
                ),
                focusColor: lightGrey,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: lightGreyWithOpacity56
                  )
                ),
                hintText: hint,
                hintStyle: TextStyle(
                  color: lightGrey2
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
