import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mool_attendance/api/local_auth_api.dart';
import 'package:mool_attendance/common/widgets/custom_button.dart';
import 'package:mool_attendance/common/widgets/custom_textfield.dart';
import 'package:mool_attendance/constants/error_handling.dart';
import 'package:mool_attendance/constants/utils.dart';
import 'package:mool_attendance/features/auth/screens/signup_screen.dart';
import 'package:mool_attendance/features/auth/services/auth_service.dart';
import 'package:mool_attendance/features/home/screens/home_screen.dart';

import 'package:http/http.dart' as http;
import 'package:mool_attendance/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    AuthService authService = AuthService();

  final TextEditingController _panController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 
    Future<void> signInUser() async {
    try {
      http.Response res = await authService.signInUser(
      username: _panController.text,
      password: _passwordController.text,
    );
    httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () async {
            dynamic decodedRes = jsonDecode(res.body);
            if(decodedRes['success']) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
            
            await prefs.setString(
                'x-auth-token', decodedRes['data']['auth']);

            if (!mounted) return;
            Provider.of<UserProvider>(
              context, listen: false).setUser(jsonEncode(decodedRes['data']['user']));
            showSnackbar(context, 'Signin Scuccessful');
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, (route) => false);
            } else {
              showSnackbar(context, decodedRes['message']);
            }
          });
            
    } catch (e) {
      if (!mounted) return;
      showSnackbar(context, e.toString());
    }
    
  }
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    final _signInFormKey = GlobalKey<FormState>();
    return Scaffold(
             key: _scaffoldKey,

        resizeToAvoidBottomInset: false,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Login_Design.png"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      height: 196,
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 196,
                ),
                Form(
                    key: _signInFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: _panController,
                          hintText: 'Phone Number/PAN Number',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Enter your Password',
                        ),
                       TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignUpScreen.routeName);
                          },
                          child: const Text(
                            'Dont have an Account, Signup',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff5E5F62),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                            text: 'Authenticate',
                            onTap: () async {
                              final isAuthenticated =
                                  await LocalAuthApi.authenticate();
                              if (isAuthenticated) {
                                await signInUser();
                                // Navigator.of(context).pushReplacement(
                                //   MaterialPageRoute(
                                //       builder: (context) => HomeScreen()),
                                // );
                              }
                            },)
                      ],
                    ),)
              ],
            ),
          ),
        ));
  }
}
