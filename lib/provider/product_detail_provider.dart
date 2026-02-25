import 'package:flutter/material.dart';

class ProductDetailProvider extends ChangeNotifier {
  int _quntity = 1;
  bool _isexpand = false;
  bool _isexpand2 = false;

  bool get isexpand => _isexpand;
  bool get isexpand2 => _isexpand2;

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

  void changeExpanded(bool value) {
    _isexpand = value;
    notifyListeners();
  }

    void changeExpanded2(bool value) {
    _isexpand2 = value;
    notifyListeners();
  }
}
