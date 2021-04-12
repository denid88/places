import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/widgets/button/base_elevated_button.dart';

class AddCategorySightScreen extends StatefulWidget {
  @override
  _AddCategorySightScreenState createState() => _AddCategorySightScreenState();
}

class _AddCategorySightScreenState extends State<AddCategorySightScreen> {

  static const String _title = 'Категория';
  static const List<String> _categories = [
    'Озеро',
    'Монастырь',
    'Гора',
    'Ресторан',
    'Отель',
    'Парк',
    'Кафе'
  ];

  String checked = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(addSightScreenAppBarH),
        child: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back_ios,
              size: 16.0,
            ),
          ),
          title: Text(
            _title,
            style: Theme.of(context).textTheme.headline3,
          ),
          centerTitle: true,
        )
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _categories.map<Widget>((c) =>
                    InkWell(
                      onTap: () {
                        setState(() {
                          checked = c;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide( //                    <--- top side
                              color: Theme.of(context).dividerColor,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               c,
                               style: TextStyle(
                                 color: Theme.of(context).brightness == Brightness.light ?
                                  darkGrey : white
                               ),
                             ),
                             checked == c ? Icon(
                               Icons.done,
                               color: Theme.of(context).accentColor,
                               size: 16.0,
                             ) : SizedBox.shrink(),
                           ],
                        ),
                      ),
                    )
                  ).toList(),
                ),
              ),
            ),
            Center(
              child: BaseElevatedButton(
                topOffset: 8.0,
                bottomOffset: 8.0,
                action: checked.isEmpty ? null : () {
                  Navigator.of(context).pop(checked);
                },
                text: 'Сохранить',
                textIsUppercase: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
