import 'package:flutter/material.dart';

class RatingController extends ChangeNotifier {
  double _ratingNumber = 0.0;

  double get ratingNumber => _ratingNumber;

  set ratingNumber(double value) {
    _ratingNumber = value;
    notifyListeners();
  }
}
