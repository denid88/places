import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';

class MockImage extends StatefulWidget {

  final Key key;
  final Function remove;

  const MockImage({
    required this.key,
    required this.remove
  });

  @override
  _MockImageState createState() => _MockImageState();
}

class _MockImageState extends State<MockImage> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.up,
      key: widget.key,
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.up) {
          widget.remove(widget.key);
        }
      },
      child: Stack(
        children: [
          Container(
            width: 72.0,
            height: 72.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: NetworkImage(
                  'https://newimg.otpusk.com/2/800x600/00/00/76/38/763872.jpg',
                ),
                fit: BoxFit.cover
              )
            ),
            margin: const EdgeInsets.only(right: 16.0),
          ),
          Positioned(
            top: -6.0,
            right: 6.0,
            child: IconButton(
              onPressed: () => widget.remove(widget.key),
              icon: Icon(
                Icons.cancel,
                color: white,
              ),
            )
          )
        ],
      ),
    );
  }
}
