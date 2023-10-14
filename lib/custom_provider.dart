import 'package:flutter/material.dart';

class CustomProvider extends ChangeNotifier {
  final Map<String, dynamic> _user = {};
  Map<String, dynamic> get user => _user;

  void setUser(Map<String, dynamic> usr) {
    _user.addAll(usr);
    notifyListeners();
  }
}
