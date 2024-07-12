import 'package:ecomtest/src/core/util/usecase/copyable.dart';
import 'package:ecomtest/src/features/home/service/entity/category_entity.dart';
import 'package:equatable/equatable.dart';

///entity to hold product data
///[https://api.escuelajs.co/api/v1/products]
class ProductEntity extends Equatable implements Copyable<ProductEntity> {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final List<String>? image;
  final DateTime? creationAt;
  final DateTime? updatedAt;
  final CategoryEntity? category;

  const ProductEntity(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.creationAt,
      required this.updatedAt,
      required this.category});

  @override
  ProductEntity? copy() {
    return ProductEntity(
        id: id,
        title: title,
        price: price,
        description: description,
        image: image,
        creationAt: creationAt,
        updatedAt: updatedAt,
        category: category);
  }

  @override
  ProductEntity? copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    List<String>? image,
    DateTime? creationAt,
    DateTime? updatedAt,
    CategoryEntity? category,
  }) {
    return ProductEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        image: image ?? this.image,
        creationAt: creationAt ?? this.creationAt,
        updatedAt: updatedAt ?? this.updatedAt,
        category: category ?? this.category);
  }

  @override
  List<Object?> get props =>
      [id, title, price, description, image, creationAt, updatedAt, category];
}
