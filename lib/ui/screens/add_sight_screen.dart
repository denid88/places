import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/widgets/button/base_elevated_button.dart';
import 'package:places/ui/widgets/button/base_text_button.dart';
import 'package:places/ui/widgets/input/base_input.dart';
import 'package:places/ui/widgets/input/dropdown_add_sight_input.dart';
import 'package:places/ui/widgets/input/images_add_sight.dart';

import 'add_category_sight_screen.dart';

class AddSightScreen extends StatefulWidget {
  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {

  static const String _title = 'Новое место';

  TextEditingController _nameController = TextEditingController();
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _longitudeController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _latitudeFocusNode = FocusNode();
  FocusNode _longitudeFocusNode = FocusNode();
  FocusNode _descriptionFocusNode = FocusNode();

  bool _disabledButton = true;
  String _selectedCategory = '';
  String _defaultDropdownHint = 'Не выбрано';

  void checkedButton() {
    if (_nameController.text.isNotEmpty &&
        _latitudeController.text.isNotEmpty &&
        _longitudeController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _selectedCategory.isNotEmpty
    ) {
      setState(() {
        _disabledButton = false;
      });
    } else {
      setState(() {
        _disabledButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
      preferredSize: const Size.fromHeight(addSightScreenAppBarH),
        child: AppBar(
          title: Stack(
            children: [
              Positioned(
                top: -5.0,
                left: -6.0,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 32.0
                  ),
                  child: BaseTextButton(
                    text: 'Отмена',
                    width: 66.0,
                    color: lightGrey2,
                    action: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              Center(
                child: Text(
                  _title,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ImagesAddSight(),
                    DropdownAddSightInput(
                      label: 'Категории',
                      hint: _defaultDropdownHint,
                      action: () async {
                        print('Переход');
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                            AddCategorySightScreen()),
                        );
                        if (result != null) {
                          setState(() {
                            _selectedCategory = result.toLowerCase();
                            _defaultDropdownHint = result;
                          });
                        } else {
                          _defaultDropdownHint = 'Не выбрано';
                        }
                      },
                    ),
                    BaseInput(
                      controller: _nameController,
                      focusNode: _nameFocusNode,
                      inputTypeAction: TextInputAction.next,
                      inputEditingComplete: () {
                        _latitudeFocusNode.requestFocus();
                        checkedButton();
                      },
                      labelText: 'Название',
                      hint: 'Введите название',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: BaseInput(
                            inputBottomOffset: 15.0,
                            controller: _latitudeController,
                            focusNode: _latitudeFocusNode,
                            inputType: TextInputType.number,
                            inputTypeAction: TextInputAction.next,
                            labelText: 'Широта',
                            hint: 'Введите название',
                            inputEditingComplete: () {
                              _longitudeFocusNode.requestFocus();
                              checkedButton();
                            },
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: BaseInput(
                            inputBottomOffset: 15.0,
                            controller: _longitudeController,
                            focusNode: _longitudeFocusNode,
                            inputTypeAction: TextInputAction.next,
                            inputType: TextInputType.number,
                            inputEditingComplete: () {
                              _descriptionFocusNode.requestFocus();
                              checkedButton();
                            },
                            labelText: 'Долгота',
                            hint: 'Введите название',
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 37.0),
                      child: GestureDetector(
                        onTap: () {
                          print('Переход на карту');
                        },
                        child: Text(
                          'Указать на карте',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                    BaseInput(
                      maxLines: 3,
                      controller: _descriptionController,
                      focusNode: _descriptionFocusNode,
                      inputType: TextInputType.multiline,
                      inputEditingComplete: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        checkedButton();
                      },
                      labelText: 'Описание',
                      hint: 'Введите текст',
                    ),
                  ],
                ),
              )
            ),
            BaseElevatedButton(
              bottomOffset: 8.0,
              topOffset: 8.0,
              textIsUppercase: true,
              action: _disabledButton ? null : () {
                final newSight = Sight(
                  name: _nameController.text,
                  lat: double.parse(_latitudeController.text),
                  lng: double.parse(_longitudeController.text),
                  url: 'https://wallpapercave.com/wp/wp4059147.jpg',
                  details: _descriptionController.text,
                  type: _selectedCategory,
                  date: '${DateTime.now()}'
                );
                Navigator.of(context).pop(newSight);
              },
              text: 'Cоздать'
            )
          ],
        ),
      )
    );
  }
}
