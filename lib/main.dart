import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mool_attendance/constants/global_variables.dart';
import 'package:mool_attendance/features/auth/screens/login_screen.dart';
import 'package:mool_attendance/features/auth/screens/signup_screen.dart';
import 'package:mool_attendance/provider/user_provider.dart';
import 'package:mool_attendance/router.dart';
import 'package:flutter/services.dart';
import 'package:mool_attendance/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mool Attendance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          appBarTheme: const AppBarTheme(elevation: 0),
          iconTheme: IconThemeData(color: Colors.black),
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.primaryColor,
          )),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: AnimatedSplashScreen(
        splash: SizedBox(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Splash_Screen.png",),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Container(
                child: Image(
                  image: AssetImage("assets/Logo.png"),
                ),
                height: 33.1,
                width: 148.63,
              ),
            ),
          ),
        ),
        duration: 3000,
        nextScreen: LoginScreen(),
      ),
    );
  }
}



// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   static const String title = 'Local Auth';
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: title,
//         theme: ThemeData(primarySwatch: Colors.purple),
//         home: FingerprintPage(),
//       );
// }