import 'package:flutter/material.dart';
import 'package:paragram/models/user.dart';
import 'package:paragram/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDatails();
    _user = user;
    notifyListeners();
  }
}
