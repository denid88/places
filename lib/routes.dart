import 'package:flutter/material.dart';
import 'package:places/ui/screens/onboarding_screen.dart';
import 'package:places/ui/screens/placeholder_screen.dart';
import 'package:places/ui/screens/settings_screen.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/screens/splash_screen.dart';
import 'package:places/ui/screens/visiting_screen.dart';

final routes = {
  SplashScreen.routeName: (BuildContext context) => SplashScreen(),
  OnBoardingScreen.routeName: (BuildContext context) => OnBoardingScreen(),
  SightListScreen.routeName: (BuildContext context) => SightListScreen(activeIndex: 0),
  PlaceHolderScreen.routeName: (BuildContext context) => PlaceHolderScreen(activeIndex: 1),
  VisitingScreen.routeName: (BuildContext context) => VisitingScreen(activeIndex: 2),
  SettingsScreen.routeName: (BuildContext context) => SettingsScreen(activeIndex: 3)
};