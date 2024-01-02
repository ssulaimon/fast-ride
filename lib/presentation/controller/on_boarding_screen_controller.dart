import 'package:flutter/material.dart';

class OnBoardingScreenController extends ChangeNotifier {
  int _currentIndex = 0;
  int _itemLenght = 0;

  int get currentIndex => _currentIndex;
  int get itemLenght => _itemLenght;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  set itemLenght(int value) {
    _itemLenght = value;
    notifyListeners();
  }
}
