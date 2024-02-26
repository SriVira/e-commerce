import 'dart:convert';

import 'package:ecommerce/model/product/product_model.dart';
import 'package:ecommerce/services/api_service.dart';
import 'package:ecommerce/services/http_service.dart';
import 'package:http/http.dart';

class ProductController {
  static Future<List<ProductModel>> getProducts() async {
    Response response = await getRequest(ApiService.getProductsApi);
    if (response.statusCode == 200) {
      dynamic result = jsonDecode(response.body);
      return productModelFromJson(jsonEncode(result['products']));
    } else {
      return Future.error(
          Exception('HTTP request failed with status: ${response.statusCode}'));
    }
  }
}
