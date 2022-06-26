import 'package:flutter/material.dart';
import 'package:mool_attendance/features/auth/screens/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // _navigatetohome();
  }

  // _navigatetohome() async {
  //   await Future.delayed(Duration(milliseconds: 1500), () {});
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: ((context) => SignInScreen()),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          // color: Colors.pink,
          image: DecorationImage(
            image: AssetImage(
              "assets/Splash_Screen.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            // color: Colors.purple,
            child: const Image(
              image: AssetImage("assets/Logo.png"),
            ),
            height: 33.1,
            width: 148.63,
          ),
        ),
      ),
    );
  }
}
