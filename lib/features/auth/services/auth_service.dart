import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mool_attendance/constants/error_handling.dart';
import 'package:mool_attendance/constants/global_variables.dart';
import 'package:mool_attendance/constants/utils.dart';
import 'package:mool_attendance/models/user.dart';

class AuthService {
  //signup user
  void signUpUser({
    required BuildContext context,
    required String pan,
    required String password,
  }) async {
    try {
      // User user = User(id: '', pan: '', password: password, token: '');

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: {},
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
  Future<http.Response> signInUser({ //Future Response
    required String username,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/auth_check/login'),
        body: jsonEncode({'username' : username,'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      return res;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
