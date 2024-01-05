import 'package:fastride/constant/routes.dart';
import 'package:fastride/presentation/controller/forgetpassword_screen_controller.dart';
import 'package:fastride/presentation/controller/home_screen_controller.dart';
import 'package:fastride/presentation/controller/login_screen_controller.dart';
import 'package:fastride/presentation/controller/on_boarding_screen_controller.dart';
import 'package:fastride/presentation/controller/registration_screen_controller.dart';
import 'package:fastride/presentation/controller/splash_screen_controller.dart';
import 'package:fastride/presentation/screen/available_drivers_screen.dart';
import 'package:fastride/presentation/screen/driver_profile_screen.dart';
import 'package:fastride/presentation/screen/forget_password_screen.dart';
import 'package:fastride/presentation/screen/home_screen.dart';
import 'package:fastride/presentation/screen/login_screen.dart';
import 'package:fastride/presentation/screen/on_boarding_screen.dart';
import 'package:fastride/presentation/screen/registration_screen.dart';
import 'package:fastride/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashScreenController()),
        ChangeNotifierProvider(create: (_) => OnBoardingScreenController()),
        ChangeNotifierProvider(create: (_) => LoginScreenController()),
        ChangeNotifierProvider(create: (_) => RegistrationScreenController()),
        ChangeNotifierProvider(create: (_) => ForgetPasswordScreenController()),
        ChangeNotifierProvider(create: (_) => HomeScreenController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        initialRoute: AppRoutes.splash,
        routes: {
          AppRoutes.splash: (context) => const SplashScreen(),
          AppRoutes.onBoardingScreen: (context) => const OnBoardingScreen(),
          AppRoutes.loginScreen: (context) => const LoginScreen(),
          AppRoutes.registrationScreen: (context) => const RegistrationScreen(),
          AppRoutes.forgetPasswordScreen: (context) =>
              const ForgetPasswordScreen(),
          AppRoutes.home: (context) => const HomeScreen(),
          AppRoutes.availableDrivers: (context) =>
              const AvailableDriverScreen(),
          AppRoutes.driverProfile: (context) => const DriverProfileScreen(),
        },
      ),
    ),
  );
}
