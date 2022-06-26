import 'package:flutter/material.dart';
import 'package:mool_attendance/features/auth/screens/signin_screen.dart';
import 'package:mool_attendance/features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignInScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => SignInScreen());
   
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
