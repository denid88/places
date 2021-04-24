import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/assets.dart';
import 'package:places/ui/res/styles.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late Future isInitialized;

  void _navigateToNext() {
    print('Переход на следующий экран');
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
