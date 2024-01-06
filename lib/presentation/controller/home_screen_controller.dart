import 'package:fastride/constant/ride_selector.dart';
import 'package:fastride/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:fastride/main.dart';

class HomeScreenController extends ChangeNotifier {
  int currentIndex = 0;
  RideType rideType = RideType.car;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void rideTypeSelector(int index) {
    if (index == 0) {
      currentIndex = index;
      rideType = RideType.car;
      notifyListeners();
    } else if (index == 1) {
      currentIndex = index;
      rideType = RideType.luxuryCar;
      notifyListeners();
    } else {
      currentIndex = index;
      rideType = RideType.motorCycle;
      notifyListeners();
    }
  }

  void findDriver() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 5));
    _isLoading = false;
    notifyListeners();
    navigatorKey.currentState!.pushNamed(AppRoutes.availableDrivers);
  }
}
