import 'package:fastride/constant/ride_selector.dart';
import 'package:fastride/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:fastride/main.dart';
import 'package:latlong2/latlong.dart';
import 'package:fastride/domain/latlong_getter.dart';

class HomeScreenController extends ChangeNotifier {
  int currentIndex = 0;
  RideType rideType = RideType.car;
  bool _lookingforLocation = false;
  bool get lookingforLocation => _lookingforLocation;
  String _baseLocationName = "Badagry";
  String _destinationLocationName = "Ikeja";
  String get baseLocationName => _baseLocationName;
  String get destinationLocationName => _destinationLocationName;
  LatLng _baseLocation = const LatLng(6.43216, 2.89265);
  LatLng _destinationLocation = const LatLng(6.5960605, 3.340787);
  LatLng get baseLocation => _baseLocation;
  LatLng get destinationLocation => _destinationLocation;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void updateBaselocation({required String location}) async {
    _lookingforLocation = true;
    notifyListeners();
    Map<String, dynamic>? result =
        await LatLongGetter.locationLatLongGetter(location: location);
    if (result != null) {
      _baseLocation = LatLng(result['latitude'], result['longitude']);
      notifyListeners();
      _baseLocationName = result["name"];
      notifyListeners();
    } else {
      return;
    }
  }

  void updateDestinationLocation({required String location}) async {
    _lookingforLocation = true;
    notifyListeners();
    Map<String, dynamic>? result =
        await LatLongGetter.locationLatLongGetter(location: location);
    if (result != null) {
      _destinationLocation = LatLng(result['latitude'], result['longitude']);
      notifyListeners();
      _destinationLocationName = result["name"];
      notifyListeners();
    } else {
      return;
    }
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
