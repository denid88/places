import 'dart:math';
import 'package:flutter/material.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/widgets/input/image_add_widget.dart';
import 'package:places/ui/widgets/input/mock_image.dart';

class ImagesAddSight extends StatefulWidget {
  @override
  _ImagesAddSightState createState() => _ImagesAddSightState();
}

class _ImagesAddSightState extends State<ImagesAddSight> {

  List<Widget> _listImageWidgets = [];

  void _addImage() {
    final rand = Random();
    final codeUnits = List.generate(8, (index) => rand.nextInt(33)+89);
    final randomKey = String.fromCharCodes(codeUnits);

    setState(() {
      _listImageWidgets.add(
        MockImage(
          key: ValueKey(randomKey),
          remove: _removeImage
        )
      );
    });
  }

  void _removeImage(key) {
    setState(() {
      _listImageWidgets.removeWhere((i) => i.key == key);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 72.0,
      margin: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: _addImage,
            child: ImageControlWidget()
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: defaultScrollPhysics,
              itemCount: _listImageWidgets.length,
              itemBuilder: (BuildContext context, int index) {
                return _listImageWidgets[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
