import 'package:flutter/material.dart';
import 'package:wanandroid/models/user.dart';

class UserProvider with ChangeNotifier {
  User _user = User(name: 'Wangc', age: 3);

  User get value => _user;

  void setUser(String name, int age) {
    _user.name = name;
    _user.age = age;
    notifyListeners();
  }
}
