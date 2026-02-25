import 'package:flutter/material.dart';
import 'package:online_groceries_app_ui/data/card_items.dart';
import 'package:online_groceries_app_ui/models/card_models.dart';
import 'package:online_groceries_app_ui/style/custom_text_style.dart';

class ProductDetailProvider extends ChangeNotifier {
  int _quntity = 1;
  bool _isexpand = false;
  bool _isexpand2 = false;
  double _baseprice = 0.0;
  bool get isexpand => _isexpand;
  bool get isexpand2 => _isexpand2;
  double get totalprice => _baseprice * _quntity;
  double get cartTotalPrice =>
      _cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  final List<CardModel> _cartItems = [];
  List<CardModel> get cartItems => _cartItems;
  final List<CardModel> _favItems = [];
  List<CardModel> get favItems => _favItems;
  int get quntity => _quntity;

  void basePrice(double price) {
    _baseprice = price;
    notifyListeners();
  }

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

  void addCartItems(
    String name,
    String image,
    double price,
    String productDetail,
    String review,
  ) {
    final existingIndex = _cartItems.indexWhere((item) => item.title == name);
    if (existingIndex != -1) {
      _cartItems[existingIndex].quantity =
          (_cartItems[existingIndex].quantity ?? 0) + _quntity;
    } else {
      _cartItems.add(
        CardModel(
          title: name,
          image: image,
          price: price,
          productDetail: productDetail,
          review: review,
          quantity: _quntity,
        ),
      );
    }
    notifyListeners();
  }

  void addFavItems(
    String name,
    String image,
    double price,
    BuildContext context,
  ) {
    final existingIndex = _favItems.indexWhere((item) => item.title == name);
    if (existingIndex != -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Item is already in favorite",
            style: CustomTextStyle().xxsmallWhiteBoldText,
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      _favItems.add(CardModel(title: name, image: image, price: price));
    }
    notifyListeners();
  }

  void removeCartItem(String name) {
    _cartItems.removeWhere((item) => item.title == name);
    notifyListeners();
  }

  void removeFavItem(String name) {
    _favItems.removeWhere((item) => item.title == name);
    notifyListeners();
  }
}
