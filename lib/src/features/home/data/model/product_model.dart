import 'dart:convert';

import 'package:ecomtest/src/features/home/data/model/category_model.dart';
import 'package:ecomtest/src/features/home/service/entity/category_entity.dart';
import 'package:ecomtest/src/features/home/service/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {super.id,
      super.title,
      super.price,
      super.description,
      super.image,
      super.creationAt,
      super.updatedAt,
      super.category});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final DateTime cd = json['creationAt'] != null
        ? DateTime.parse(json['creationAt'])
        : DateTime.now();

    final DateTime ud = json['updatedAt'] != null
        ? DateTime.parse(json['updatedAt'])
        : DateTime.now();

    final category = CategoryModel.fromJson(json['category']);

    final images = json['image'];

    return ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'].toDouble(),
        description: json['description'],
        image: images,
        creationAt: cd,
        updatedAt: ud,
        category: category);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'creationAt': creationAt!.toIso8601String(),
      'updatedAt': updatedAt!.toIso8601String(),
      'category': category.toString(),
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
