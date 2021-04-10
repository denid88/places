import 'package:flutter/material.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screens/placeholder_screen.dart';
import 'package:places/ui/screens/settings_screen.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/screens/visiting_screen.dart';
import 'package:provider/provider.dart';

import 'domain/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: App()
    )
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  late int _activeScreen;
  late List<Widget> _screens;

  void changeActiveScreen(int index) {
    setState(() {
      _activeScreen = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _activeScreen = 0;
    _screens = [
      SightListScreen(activeIndex: 0, changeScreen: changeActiveScreen),
      PlaceHolderScreen(activeIndex: 1, changeScreen: changeActiveScreen),
      VisitingScreen(activeIndex: 2, changeScreen: changeActiveScreen),
      SettingsScreen(activeIndex: 3, changeScreen: changeActiveScreen)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      themeMode: Provider.of<ThemeModel>(context, listen: true).mode,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: _screens[_activeScreen],
    );
  }
}
