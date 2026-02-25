import 'package:flutter/material.dart';
import 'package:online_groceries_app_ui/models/card_models.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  List<CardModel> _allProducts = [];
  List<CardModel> _filterProduct = [];

  List<CardModel> get filterProduct => _filterProduct;

  void initProduct(List<CardModel> product) {
    _allProducts = product;
    _filterProduct = product;
    notifyListeners();
  }

  void searchByName(String query) {
    if (query.isEmpty) {
      _filterProduct = _allProducts;
    } else {
      _filterProduct = _allProducts
          .where(
            (product) =>
                product.title.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
    notifyListeners();
  }

  void clearSearch() {
    searchController.clear();
    _filterProduct = _allProducts;
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
