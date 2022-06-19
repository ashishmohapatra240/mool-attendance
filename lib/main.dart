import 'package:flutter/material.dart';
import 'package:mool_attendance/constants/global_variables.dart';
import 'package:mool_attendance/features/auth/screens/login_screen.dart';
import 'package:mool_attendance/features/auth/screens/signup_screen.dart';
import 'package:mool_attendance/router.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
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
      home: SignUpScreen(),
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