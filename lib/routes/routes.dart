import 'package:flutter/material.dart';
import 'package:pretium/views/homepage.dart';
import 'package:pretium/views/auth/login_screen.dart';
import 'package:pretium/views/get_started.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String getStarted = '/getStarted';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => Homepage());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case getStarted:
        return MaterialPageRoute(builder: (_) => Home());

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
