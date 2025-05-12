import 'package:flutter/material.dart';
import 'package:pretium/routes/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prentium',
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.getStarted,
    );
  }
}
