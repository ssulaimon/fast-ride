// ignore_for_file: use_build_context_synchronously

import 'package:fastride/domain/firebase_email_auth.dart';
import 'package:flutter/material.dart';

import '../screen/registration_screen.dart';

class PasswordResetScreenController extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void passwordReset(
      {required String email, required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 5));
    String status =
        await FirebaseEmailAuth().sendPasswordResetLink(email: email);
    _isLoading = false;
    notifyListeners();

    if (status == "Reset Link Sent") {
      resultDialogue(
          context: context,
          image: "assets/images/completed-mark.png",
          message: status);
    } else {
      resultDialogue(
          context: context,
          image: "assets/images/error_mark.png",
          message: status);
    }
  }
}
