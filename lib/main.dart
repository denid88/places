import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/state/data.dart';
import 'package:places/domain/state/history.dart';
import 'package:places/domain/state/onboard.dart';
import 'package:places/routes.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:places/domain/state/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/interactor/place_interactor_impl.dart';
import 'data/respository/place_repository_impl.dart';
import 'data/utils/api_client.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => Data(
            placeInteractor: PlaceInteractorImpl(
              placeRepository: PlaceRepositoryImpl(
                apiClient: ApiClient(dioClient: Dio()),
              )
            )
          )..fetchData(),
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
