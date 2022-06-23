import 'package:flutter/cupertino.dart';
import 'package:mool_attendance/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(id: '', pan: '', password: '', token: '');

  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
