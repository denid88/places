import 'package:flutter/material.dart';

class MiddleWareBar extends StatelessWidget {

  final Widget widget;
  final bool middlewareValue;
  final Function action;

  const MiddleWareBar({
    required this.widget,
    required this.action,
    this.middlewareValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return middlewareValue ?
      Stack(
        children: [
          widget,
          GestureDetector(
            onTap: () => action(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.red
              ),
              margin: const EdgeInsets.only(right: 40.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ],
      ) : widget;
  }
}
