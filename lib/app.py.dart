import 'package:flutter/material.dart';
import 'package:pretium/routes/routes.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pretium/utils/constants.dart';
import 'package:pretium/views/get_started.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.generateRoute,
      home: AnimatedSplashScreen(
        backgroundColor: kDarkGreen,
        splash: Image.asset('images/logo.png', fit: BoxFit.cover),
        nextScreen: Home(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 2000,
      ),
    );
  }
}
