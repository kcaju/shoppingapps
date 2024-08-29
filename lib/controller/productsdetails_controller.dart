import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapps/model/productdetails_screen/productdetails_model.dart';

class ProductsdetailsController with ChangeNotifier {
  ProductsDetailsModel? prodObj;
  bool isLoading = false;
  Future<void> getProductDetails({required String productId}) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://fakestoreapi.com/products/$productId");
    var resp = await http.get(url);
    if (resp.statusCode == 200) {
      prodObj = productsDetailsModelFromJson(resp.body);

      isLoading = false;
    }
    notifyListeners();
  }
}
