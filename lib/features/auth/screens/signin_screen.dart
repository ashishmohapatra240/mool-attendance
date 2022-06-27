import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mool_attendance/api/local_auth_api.dart';
import 'package:mool_attendance/common/widgets/custom_button.dart';
import 'package:mool_attendance/common/widgets/custom_textfield.dart';
import 'package:mool_attendance/constants/error_handling.dart';
import 'package:mool_attendance/constants/utils.dart';
import 'package:mool_attendance/features/auth/services/auth_service.dart';
import 'package:mool_attendance/features/home/screens/home_screen.dart';

import 'package:http/http.dart' as http;
import 'package:mool_attendance/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/login-screen';

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignInScreen> {
  AuthService authService = AuthService();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  dynamic decodedRes;

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
            decodedRes = jsonDecode(res.body);
            if (decodedRes['success']) {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              await prefs.setString('x-auth-token', decodedRes['data']['auth']);

              if (!mounted) return;
              Provider.of<UserProvider>(context, listen: false)
                  .setUser(jsonEncode(decodedRes['data']['user']));
              // showSnackbar(context, 'Signin Scuccessful');
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.routeName, (route) => false);
            } else {
              String message;
              // print(decodedRes['message'] + "3bfuwfhr");
              switch (decodedRes['message'].toString()) {
                case 'WRONG_CREDENTIALS':
                  message = "Invalid credentials";
                  break;
                case 'username_FIELD_REQUIRED':
                  message = "Enter username";
                  break;
                case 'password_FIELD_REQUIRED':
                  message = 'Enter password';
                  break;
                case 'Sorry user not exsist.':
                  message = "Invalid username";
                  break;
                default:
                  message = "Login Failed";
              }
              showSnackbar(context, message);
              setState(() {
                // user_valid = _userErrorText;
                // pass_valid = _passErrorText;
              });
              // decodedRes = null;
            }
          });
    } catch (e) {
      if (!mounted) return;
      showSnackbar(context, "Couldn't connect to the server.");
    }
  }

  String? _userErrorText() {
    if (decodedRes != null) {
      final text = decodedRes['message'].toString();
      if (text == 'username_FIELD_REQUIRED') {
        return 'Enter username';
      }
      if (text == 'Sorry the user not exsist') {
        return 'Invalid username';
      }
    }
    // return null if the text is valid
    return null;
  }

  String? _passErrorText() {
    if (decodedRes != null) {
      final text = decodedRes['message'].toString();
      if (text == 'password_FIELD_REQUIRED') {
        return 'Enter password';
      }
      if (text == 'WRONG_CREDENTIALS') {
        return 'Invalid credentials';
      }
    }
    // return null if the text is valid
    return null;
  }

  // dynamic user_valid = (_) {
  //   return null;
  // };

  // dynamic pass_valid = (_) {
  //   return null;
  // };

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Login_Design.png"),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.05, height * 0.05, width * 0.05, height * 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 4.4,
                      ),
                      Container(
                        height: height / 8,
                        width: width / 2.5,
                        // color: Colors.pink,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            'Hey there,\nWelcome',
                            style: TextStyle(
                                fontSize: (width * height) / 6000,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //  SizedBox(
                  //   height: MediaQuery.of(context).size.height/10,
                  // ),
                  Form(
                    key: _signInFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextField(
                          controller: _panController,
                          hintText: 'Phone Number/PAN Number',
                          isPass: false,
                          errText: _userErrorText,
                        ),
                        SizedBox(
                          height: height / 40,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Enter your Password',
                          isPass: true,
                          errText: _passErrorText,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff5E5F62),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 60,
                        ),
                        CustomButton(
                            text: 'Login',
                            onTap: () async {
                              // final isAuthenticated =
                              //     await LocalAuthApi.authenticate();
                              // if (isAuthenticated) {
                              await signInUser();
                              // Navigator.of(context).pushReplacement(
                              //   MaterialPageRoute(
                              //       builder: (context) => HomeScreen()),
                              // );
                            }
                            // },
                            )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
