import 'package:flutter/material.dart';
import 'package:places/data/utils/api_client.dart';
import 'package:places/domain/data.dart';
import 'package:places/domain/history.dart';
import 'package:places/domain/onboard.dart';
import 'package:places/routes.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screens/splash_screen.dart';
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

  @override
  void initState() {
    DioClient()..init().then((dio) async {
      final users = await dio.get('https://jsonplaceholder.typicode.com/users');
      print(users);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      themeMode: context.watch<ThemeModel>().mode,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: SplashScreen(),
      routes: routes
    );
  }
}
