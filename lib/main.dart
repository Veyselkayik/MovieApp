import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movie_project/controller/controller.dart';
import 'package:movie_project/screen/no_internet_connection.dart';
import 'package:movie_project/screen/search.dart';
import 'package:movie_project/utility/theme/theme.dart';
import 'Screen/home_page.dart';
import 'Screen/movie_project1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final pinsoftText = "Pinsoft";

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: CustomTheme().theme,
        home: AnimatedSplashScreen.withScreenFunction(
            splash: Column(
              children: [
                Text(
                  pinsoftText,
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
            screenFunction: () async {
              var connectivityResult = await Connectivity().checkConnectivity();
              if (connectivityResult == ConnectivityResult.mobile ||
                  connectivityResult == ConnectivityResult.wifi) {
                return HomePage();
              } else {
                return NoInternetConnection();
              }
            },
            splashTransition: SplashTransition.fadeTransition));
  }
}
