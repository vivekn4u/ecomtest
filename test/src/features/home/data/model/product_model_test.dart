import 'dart:convert';
import 'package:ecomtest/src/features/home/data/model/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:ecomtest/src/features/home/data/model/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> jsonResponse;

  setUpAll(() async {
    final response = await http.get(
        Uri.parse("https://api.escuelajs.co/api/v1/products?offset=0&limit=1"));

    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body)[0];
    } else {
      jsonResponse = {};
    }
  });

  group("check product model", () {
    test("single product", () {
      //Arrange
      expect(jsonResponse, isNotEmpty);
      final firstProduct = jsonResponse;

      //Act
      final result = ProductModel.fromJson(firstProduct);

      //Assert
      expect(result, isA<ProductModel>());
      expect(result.category, isA<CategoryModel>());
    });
  });
}
