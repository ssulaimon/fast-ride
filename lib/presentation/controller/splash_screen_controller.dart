import 'package:fastride/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:fastride/main.dart';

class SplashScreenController extends ChangeNotifier {
  Future<void> pushToNextScreen() async {
    return await Future.delayed(
      const Duration(
        seconds: 5,
      ),
      () {
        navigatorKey.currentState?.popAndPushNamed(
          AppRoutes.onBoardingScreen,
        );
      },
    );
  }
}
