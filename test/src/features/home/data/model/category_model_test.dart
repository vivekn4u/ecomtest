import 'dart:convert';

import 'package:ecomtest/src/features/home/data/model/category_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  late Map<String, dynamic> jsonResponse;

  setUpAll(() async {
    final response = await http
        .get(Uri.parse("https://api.escuelajs.co/api/v1/categories/1"));

    if (response.statusCode == 200) {
      jsonResponse = jsonDecode(response.body);
    } else {
      jsonResponse = {};
    }
  });

  group("check category model", () {
    test("single category", () {
      //Arrange
      expect(jsonResponse, isNotEmpty);

      //Act
      final result = CategoryModel.fromJson(jsonResponse);

      //Assert
      expect(result.id!, 1);
      expect(result.name, 'Clothes');
    });
  });
}
