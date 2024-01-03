import 'package:fastride/constant/routes.dart';
import 'package:fastride/presentation/controller/login_screen_controller.dart';
import 'package:fastride/presentation/controller/on_boarding_screen_controller.dart';
import 'package:fastride/presentation/controller/splash_screen_controller.dart';
import 'package:fastride/presentation/screen/login_screen.dart';
import 'package:fastride/presentation/screen/on_boarding_screen.dart';
import 'package:fastride/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SplashScreenController()),
      ChangeNotifierProvider(create: (_) => OnBoardingScreenController()),
      ChangeNotifierProvider(create: (_) => LoginScreenController()),
    ],
    child: MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.onBoardingScreen: (context) => const OnBoardingScreen(),
        AppRoutes.loginScreen: (context) => const LoginScreen(),
      },
    ),
  ));
}
