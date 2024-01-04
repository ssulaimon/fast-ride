import 'package:flutter/material.dart';

class LoginScreenController extends ChangeNotifier {
  bool _showPassword = true;

  bool get showPassword => _showPassword;

  void setShowPassword() {
    if (_showPassword == true) {
      _showPassword = false;
      notifyListeners();
    } else {
      _showPassword = true;
      notifyListeners();
    }
  }
}
