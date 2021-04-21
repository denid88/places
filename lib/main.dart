import 'package:flutter/material.dart';
import 'package:places/domain/data.dart';
import 'package:places/domain/history.dart';
import 'package:places/domain/onboard.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screens/onboarding_screen.dart';
import 'package:places/ui/screens/placeholder_screen.dart';
import 'package:places/ui/screens/settings_screen.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/screens/visiting_screen.dart';
import 'package:provider/provider.dart';

import 'domain/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => Data(),
        ),
        ChangeNotifierProvider(
          create: (context) => History(),
        ),
        ChangeNotifierProvider(
          create: (context) => OnBoard()
        )
      ],
      child: App(),
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
      themeMode: context.watch<ThemeModel>().mode,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: Provider.of<OnBoard>(context, listen: true).enabled ?
        OnBoardingScreen() : _screens[_activeScreen],
    );
  }
}
