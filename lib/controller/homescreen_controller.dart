import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapps/model/shopping_screen/products_model.dart';

class HomescreenController with ChangeNotifier {
  List categorieslist = ["All"];
  List<ProductsModel> productList = [];
  bool isProductLoading = false;
  bool isCategoryLoading = false;

  int selectedCategoryIndex = 0;

  Future<void> getAllProducts({String category = ''}) async {
    isProductLoading = true;
    notifyListeners();
    try {
      final allurl = Uri.parse("https://fakestoreapi.com/products");
      final categoryurl =
          Uri.parse("https://fakestoreapi.com/products/category/$category");
      final url = category.isEmpty ? allurl : categoryurl;
      var allProd = await http.get(url);
      print(allProd.statusCode);
      if (allProd.statusCode == 200) {
        productList = productsModelFromJson(allProd.body);
      }
    } catch (e) {
      print(e);
    }
    isProductLoading = false;
    notifyListeners();
  }

  Future<void> getCategories() async {
    isCategoryLoading = true;
    notifyListeners();
    try {
      final url = Uri.parse("https://fakestoreapi.com/products/categories");
      var response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        categorieslist.addAll(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
    isCategoryLoading = false;

    notifyListeners();
  }

  void getProductByCategory() {}

  getCategoryIndex(int index) {
    selectedCategoryIndex = index;
    if (selectedCategoryIndex == 0) {
      getAllProducts();
    } else {
      getAllProducts(category: categorieslist[selectedCategoryIndex]);
    }
    notifyListeners();
  }
}
