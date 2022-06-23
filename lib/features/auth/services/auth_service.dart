import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mool_attendance/constants/error_handling.dart';
import 'package:mool_attendance/constants/global_variables.dart';
import 'package:mool_attendance/constants/utils.dart';
import 'package:mool_attendance/features/home/screens/home_screen.dart';
import 'package:mool_attendance/models/user.dart';
import 'package:mool_attendance/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //signup user
  void signUpUser({
    required BuildContext context,
    required String pan,
    required String password,
  }) async {
    try {
      User user = User(id: '', pan: '', password: password, token: '');

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () {
            showSnackbar(context,
                'Account created! Login with the same account credentials');
          });
    } catch (e) {
      showSnackbar(context, e.toString());
      print(e.toString());
    }
  }

  //signin User
  void signInUser({
    required BuildContext context,
    required String pan,
    required String password,
  }) async {
    try {
      User user = User(id: '', pan: '', password: password, token: '');

      http.Response res = await http.post(
        Uri.parse('$uri/auth_check/validate/info'),
        body: jsonEncode({"details": pan, "type": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(res.body);
      print('Hello World');

      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, (route) => false);
            showSnackbar(context, 'Signin Scuccessful');
          });
    } catch (e) {
      showSnackbar(context, e.toString());
      print(e.toString());
    }
  }
}
