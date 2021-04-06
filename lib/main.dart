import 'package:flutter/material.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screen/placeholder_screen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

void main() {
  runApp(App());
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
      PlaceHolderScreen(activeIndex: 3, changeScreen: changeActiveScreen)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: _screens[_activeScreen],
    );
  }
}
