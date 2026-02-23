import 'package:flutter/material.dart';

class ProductDetailProvider extends ChangeNotifier {
  int _quntity = 1;

  int get quntity => _quntity;

  void incrementQuntity() {
    _quntity++;
    notifyListeners();
  }

  void decrementQuntity() {
    if (_quntity != 1 || _quntity > 1) {
      _quntity--;
    }
    notifyListeners();
  }
}
