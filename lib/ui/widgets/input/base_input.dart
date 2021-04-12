import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/res/text_styles.dart';

class BaseInput extends StatefulWidget {

  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final bool labelIsUpperCase;
  final double labelTopOffset;
  final double labelBottomOffset;
  final double inputTopOffset;
  final double inputBottomOffset;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputTypeAction;
  final maxLines;
  final dynamic inputEditingComplete;

  const BaseInput({
    required this.controller,
    required this.labelText,
    required this.hint,
    required this.focusNode,
    this.inputEditingComplete,
    this.inputType = TextInputType.text,
    this.inputTypeAction = TextInputAction.done,
    this.labelIsUpperCase = true,
    this.labelTopOffset = 0.0,
    this.labelBottomOffset = 12.0,
    this.inputTopOffset = 0.0,
    this.inputBottomOffset = 24.0,
    this.topPadding = 10.0,
    this.bottomPadding = 10.0,
    this.leftPadding = 16.0,
    this.rightPadding = 16.0,
    this.maxLines = 1,
  });

  @override
  _BaseInputState createState() => _BaseInputState();
}

class _BaseInputState extends State<BaseInput> {

  bool enabledClear = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(focusNodeHandler);
  }

  void focusNodeHandler() {
    if (!widget.focusNode.hasFocus) {
      setState(() {
        enabledClear = false;
      });
    } else {
      if (widget.controller.text.isNotEmpty) {
        setState(() {
          enabledClear = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: widget.labelBottomOffset, top: widget.labelTopOffset),
            width: double.infinity,
            child: Text(
              widget.labelIsUpperCase ? '${widget.labelText}'.toUpperCase() : widget.labelText,
              style: baseLabelStyle
            )
          ),
          Container(
            margin: EdgeInsets.only(bottom: widget.inputBottomOffset, top: widget.inputTopOffset),
            child: TextField(
              maxLines: widget.maxLines,
              keyboardType: widget.inputType,
              textInputAction: widget.inputTypeAction,
              controller: widget.controller,
              focusNode: widget.focusNode,
              style: ltTextRegular16,
              onChanged: (value) {
                value.isNotEmpty ?
                  setState(() {
                    enabledClear = true;
                  }) :
                  setState(() {
                    enabledClear = false;
                  });
              },
              onEditingComplete: widget.inputEditingComplete,
              decoration: InputDecoration(
                suffixIcon: enabledClear ? GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    widget.controller.clear();
                    setState(() {
                      enabledClear = false;
                    });
                  },
                  child: Icon(
                    Icons.cancel,
                    color: darkGrey,
                  )
                ) : null,
                contentPadding: EdgeInsets.only(
                  top: widget.topPadding,
                  bottom: widget.bottomPadding,
                  left: widget.leftPadding,
                  right: widget.rightPadding
                ),
                focusColor: lightGrey,
                disabledBorder: lightGreyBorderStyle,
                enabledBorder: lightGreyBorderStyle,
                border: lightGreyBorderStyle,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                  ),
                  borderRadius: BorderRadius.circular(12.0)
                ),
                hintText: widget.hint,
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
