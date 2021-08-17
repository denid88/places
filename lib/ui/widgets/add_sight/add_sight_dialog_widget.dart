import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/widgets/button/base_elevated_button.dart';

class AddSightDialogWidget extends StatelessWidget {

  static const List<Map<String, dynamic>> controlActionsList = [
    {'icon': photocameraIconURL, 'label': 'Камера', 'action': ActionControl.camera},
    {'icon': imageIconURL, 'label': 'Фотография', 'action': ActionControl.gallery},
    {'icon': copyIconURL, 'label': 'Файл', 'action': ActionControl.file},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  onTap: () => Navigator.of(context).pop(entry.value['action']),
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
                        Text(value['label'])
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
                action: () => Navigator.of(context).pop(null),
                text: 'Отмена',
                backgroundColor: white,
                textColor: green,
                textIsUppercase: true,
              )
          )
        ],
      ),
    );
  }
}

enum ActionControl {camera, file, gallery}