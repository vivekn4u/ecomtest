import 'package:ecomtest/src/core/util/usecase/copyable.dart';
import 'package:equatable/equatable.dart';

///class to holed the product category data
///[https://api.escuelajs.co/api/v1/categories]
class CategoryEntity extends Equatable implements Copyable<CategoryEntity> {
  final int? id;
  final String? name;
  final String? image;
  final DateTime? creationAt;
  final DateTime? updatedAt;

  //constructor
  const CategoryEntity(
      {required this.id,
      required this.name,
      required this.image,
      required this.creationAt,
      required this.updatedAt});

  @override
  CategoryEntity? copy() {
    return CategoryEntity(
        id: id,
        name: name,
        image: image,
        creationAt: creationAt,
        updatedAt: updatedAt);
  }

  @override
  CategoryEntity? copyWith({
    int? id,
    String? name,
    String? image,
    DateTime? creationAt,
    DateTime? updatedAt,
  }) {
    return CategoryEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        creationAt: creationAt ?? this.creationAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  List<Object?> get props => [id, name, image, creationAt, updatedAt];
}
