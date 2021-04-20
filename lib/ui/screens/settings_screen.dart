import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/theme.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/sizes.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/widgets/button/base_action_button.dart';
import 'package:places/ui/widgets/common/bottom_navigation_bar_widget.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {

  final int activeIndex;
  final Function changeScreen;

  const SettingsScreen({
    required this.activeIndex,
    required this.changeScreen
  });

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  static const title = 'Настройки';
  bool themeMode = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    themeMode = context.watch<ThemeModel>().mode == ThemeMode.light ?
      false : true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(settingsScreenAppBarH),
        child: AppBar(
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
          centerTitle: true,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0, bottom: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: borderBottom,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Тёмная тема',
                      style: TextStyle(
                        color: context.watch<ThemeModel>().mode == ThemeMode.light ?
                          lowBlack : white
                      ),
                    ),
                    CupertinoSwitch(
                      value: themeMode,
                      onChanged: (value) {
                        setState(() {
                          themeMode = value;
                        });
                        final currentMode = themeMode ?
                          ThemeMode.dark : ThemeMode.light;
                        context.read<ThemeModel>().changeTheme(currentMode);
                      }
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                decoration: borderBottom,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Смотреть туториал',
                      style: TextStyle(
                        color: context.watch<ThemeModel>().mode == ThemeMode.light ?
                          lowBlack : white
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: BaseActionButton(icon: infoIconURL, action: () {
                        print('Показать туториал');
                      })
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        activeIndex: widget.activeIndex,
        changeScreen: widget.changeScreen
      )
    );
  }
}
