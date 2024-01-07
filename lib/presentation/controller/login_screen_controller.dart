// ignore_for_file: use_build_context_synchronously

import 'package:fastride/constant/routes.dart';
import 'package:fastride/domain/firebase_email_auth.dart';
import 'package:fastride/presentation/screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:fastride/domain/user_model.dart';
import 'package:fastride/main.dart';

class LoginScreenController extends ChangeNotifier {
  bool _showPassword = true;

  bool get showPassword => _showPassword;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setShowPassword() {
    if (_showPassword == true) {
      _showPassword = false;
      notifyListeners();
    } else {
      _showPassword = true;
      notifyListeners();
    }
  }

  void loginUser(
      {required UserModel userModel, required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 5));
    FirebaseEmailAuth firebaseEmailAuth = FirebaseEmailAuth();

    String result = await firebaseEmailAuth.loginUserAccount(
      userModel: userModel,
    );

    _isLoading = false;
    notifyListeners();
    if (result == "Login successful") {
      navigatorKey.currentState!.popAndPushNamed(AppRoutes.home);
    } else {
      resultDialogue(
          context: context,
          image: "assets/images/error_mark.png",
          message: result);
    }
  }
}
