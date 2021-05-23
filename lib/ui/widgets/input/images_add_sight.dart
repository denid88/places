import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/widgets/button/base_elevated_button.dart';
import 'package:places/ui/widgets/input/image_add_widget.dart';
import 'package:places/ui/widgets/input/mock_image.dart';

class ImagesAddSight extends StatefulWidget {
  @override
  _ImagesAddSightState createState() => _ImagesAddSightState();
}

class _ImagesAddSightState extends State<ImagesAddSight> {
  static const List<Map<String, dynamic>> controlActionsList = [
    {'icon': photocameraIconURL, 'action': 'Камера'},
    {'icon': imageIconURL, 'action': 'Фотография'},
    {'icon': copyIconURL, 'action': 'Файл'},
  ];

  String action = '';

  List<Widget> _listImageWidgets = [];

  void _addImage() async {
    setState(() {
      action = '';
    });
    final rand = Random();
    final codeUnits = List.generate(8, (index) => rand.nextInt(33)+89);
    final randomKey = String.fromCharCodes(codeUnits);

    await showDialog(
      context: context,
      builder: (context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(14.5),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: white
              ),
              child: Column(
                children: controlActionsList.asMap().entries.map<Widget>((entry) {
                  int idx = entry.key;
                  Map<String, dynamic> value = entry.value;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        action = entry.value['action'];
                      });
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: idx == 0 ?
                      const EdgeInsets.only(bottom: 12.0) :
                      idx != controlActionsList.length - 1 ?
                        const EdgeInsets.symmetric(vertical: 12.0) :
                        const EdgeInsets.only(top: 12.0),
                      decoration: BoxDecoration(
                        border: idx != controlActionsList.length - 1 ? Border(
                          bottom: BorderSide( //                    <--- top side
                            color: Theme.of(context).dividerColor,
                            width: 1.0,
                          ),
                        ) : null,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            value['icon'],
                            width: 18.0,
                            height: 18.0,
                          ),
                          SizedBox(width: 16.0),
                          Text(value['action'])
                        ],
                      ),
                    ),
                  );
                }).toList()
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
              child: BaseElevatedButton(
                action: () {
                  Navigator.of(context).pop();
                },
                text: 'Отмена',
                backgroundColor: Colors.white,
                textColor: green,
                textIsUppercase: true,
              )
            )
          ],
        ),
      )
    );

    if (action.isNotEmpty) {
      setState(() {
        _listImageWidgets.add(
          MockImage(
            key: ValueKey(randomKey),
            remove: _removeImage
          )
        );
      });
    }
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
