import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mool_attendance/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(sId: "", phone: "", primaryEmail: "", username: "", pAN: "", loginstate: 0, displayName: "", dateOfBirth: "", image: "", locationId: "", createdAt: "", updatedAt: "");

  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(jsonDecode(user));
    notifyListeners();
  }
}
