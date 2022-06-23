import 'dart:convert';

class User {
  final String id;
  final String pan;
  final String password;
  final String token;

  User({
    required this.id,
    required this.pan,
    required this.password,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pan': pan,
      'password': password,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      pan: map['pan'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}