import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/onboard.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/styles.dart';
import 'package:places/ui/screens/onboarding_screen.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late Future isInitialized;

  void _navigateToNext() {
    context.read<OnBoard>().enabled ?
      Navigator.of(context).pushReplacementNamed(OnBoardingScreen.routeName) :
      Navigator.of(context).pushReplacementNamed(SightListScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    isInitialized = Future.delayed(Duration(seconds: 2));
    isInitialized.then((_) => _navigateToNext());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: splashBackgroundLinear
      ),
      child: Center(
        child: SvgPicture.asset(
          logoIconURL,
          width: 160.0,
          height: 160.0,
        ),
      ),
    );
  }
}
