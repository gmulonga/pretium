import 'package:flutter/material.dart';
import 'package:pretium/views/dashboard.dart';
import 'package:pretium/views/homepage.dart';
import 'package:pretium/views/auth/login_screen.dart';
import 'package:pretium/views/get_started.dart';
import 'package:pretium/views/auth/register_screen.dart';
import 'package:pretium/views/auth/forgot_password.dart';

class AppRoutes {
  static const String dashboard = '/dashboard';
  static const String login = '/login';
  static const String getStarted = '/getStarted';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String navigation = '/navigation';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return MaterialPageRoute(builder: (_) => Dashboard());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case getStarted:
        return MaterialPageRoute(builder: (_) => Home());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case navigation:
        return MaterialPageRoute(builder: (_) => Navigation());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPassword());

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
