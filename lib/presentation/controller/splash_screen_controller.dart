import 'package:fastride/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:fastride/main.dart';
import 'package:fastride/domain/firebase_email_auth.dart';

class SplashScreenController extends ChangeNotifier {
  Future<void> pushToNextScreen() async {
    return await Future.delayed(
      const Duration(
        seconds: 5,
      ),
      () {
        if (FirebaseEmailAuth.user != null) {
          navigatorKey.currentState!.popAndPushNamed(
            AppRoutes.home,
          );
        } else {
          navigatorKey.currentState?.popAndPushNamed(
            AppRoutes.onBoardingScreen,
          );
        }
      },
    );
  }
}
