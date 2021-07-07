import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor_impl.dart';
import 'package:places/data/respository/place_repository_impl.dart';
import 'package:places/data/utils/api_client.dart';
import 'package:places/domain/state/data.dart';
import 'package:places/domain/state/history.dart';
import 'package:places/domain/state/onboard.dart';
import 'package:places/routes.dart';
import 'package:places/ui/res/themes.dart';
import 'package:places/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:places/domain/state/theme.dart';

void main() async {
  //await dotenv.load(fileName: '.env');
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

  final PlaceInteractorImpl _placeInteractor = PlaceInteractorImpl(
    placeRepository: PlaceRepositoryImpl(apiClient: ApiClient(dioClient: Dio()))
  );

  @override
  void initState() {
    final response = _placeInteractor.getPlaces(3, '');
    response.then((data) {
      print(data);
    })
    .catchError((e) {
      print('Exception');

      if (e is DioError) {
        print(e.message);
      }

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
