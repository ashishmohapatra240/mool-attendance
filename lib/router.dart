import 'package:flutter/material.dart';
import 'package:mool_attendance/features/auth/screens/login_screen.dart';
import 'package:mool_attendance/features/auth/screens/signup_screen.dart';
import 'package:mool_attendance/features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => LoginScreen());
    case SignUpScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => SignUpScreen());
          case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => HomeScreen());

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen not found'),
          ),
        ),
      );
  }
}
