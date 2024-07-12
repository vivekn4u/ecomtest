import 'package:ecomtest/src/core/util/usecase/usecase.dart';
import 'package:ecomtest/src/features/home/service/entity/category_entity.dart';
import 'package:ecomtest/src/features/home/service/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

/// marker interface
abstract class HomeUseCase {}

abstract class GetProducts extends HomeUseCase
    implements UseCase<List<ProductEntity>?, OffsetParams> {}

abstract class GetCategories extends HomeUseCase
    implements UseCase<List<CategoryEntity>?, NoParams> {}

/// this class is used for product parameter method
class ProductParams extends Equatable {
  final ProductEntity? product;

  const ProductParams({required this.product});

  @override
  List<Object?> get props => [
        product,
      ];
}

/// this class is used for product parameter method
class OffsetParams extends Equatable {
  final int? offset;

  const OffsetParams({required this.offset});

  @override
  List<Object?> get props => [
        offset,
      ];
}
