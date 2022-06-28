import 'package:flutter/material.dart';
import 'package:mool_attendance/features/auth/screens/signin_screen.dart';

import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Future.delayed(
          Duration(milliseconds: 2000),
          () {
            setState(
              () {
                _visible = !_visible;
              },
            );
            // _navigatetohome();
          },
        );
      },
    );
  }

  _navigatetohome() async {
    // await Future.delayed(Duration(milliseconds: 1500), () {});

    Navigator.pushReplacement(
      context,
      // MaterialPageRoute(
      //   builder: ((context) => SignInScreen()),
      // ),
      PageTransition(type: PageTransitionType.fade, child: SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        curve: Curves.linear,
        duration: const Duration(milliseconds: 1500),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/Splash_Screen.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              child: const Image(
                image: AssetImage("assets/Logo.png"),
              ),
              height: 33.1,
              width: 148.63,
            ),
          ),
        ),
      ),
    );
  }
}
