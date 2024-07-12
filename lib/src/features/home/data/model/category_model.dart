import 'package:ecomtest/src/features/home/service/entity/category_entity.dart';

///model class
class CategoryModel extends CategoryEntity {
  const CategoryModel(
      {required super.id,
      required super.name,
      required super.image,
      required super.creationAt,
      required super.updatedAt});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final DateTime cd = json['creationAt'] != null
        ? DateTime.parse(json['creationAt'])
        : DateTime.now();

    final DateTime ud = json['updatedAt'] != null
        ? DateTime.parse(json['updatedAt'])
        : DateTime.now();
    return CategoryModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        creationAt: cd,
        updatedAt: ud);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'creationAt': creationAt!.toIso8601String(),
      'updatedAt': updatedAt!.toIso8601String(),
    };
  }
}
