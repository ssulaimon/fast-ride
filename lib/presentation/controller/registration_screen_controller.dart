// ignore_for_file: use_build_context_synchronously

import 'package:fastride/domain/firebase_email_auth.dart';
import 'package:fastride/domain/user_model.dart';
import 'package:fastride/presentation/screen/registration_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreenController extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void registerUser(
      {required UserModel userModel, required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(
      seconds: 5,
    ));
    FirebaseEmailAuth firebaseEmailAuth = FirebaseEmailAuth();
    String status = await firebaseEmailAuth.createAccount(userModel: userModel);
    _isLoading = false;
    notifyListeners();
    if (status == "User created") {
      resultDialogue(
          context: context,
          image: "assets/images/completed-mark.png",
          message: "Your Registration Is Completed");
    } else {
      resultDialogue(
          context: context,
          image: "assets/images/error_mark.png",
          message: status);
    }
  }
}
