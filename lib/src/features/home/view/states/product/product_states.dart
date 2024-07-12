import 'package:ecomtest/src/core/util/error/failures.dart';
import 'package:ecomtest/src/features/home/service/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductCompletedState extends ProductState {
  final List<ProductEntity>? ProductList;

  ProductCompletedState({required this.ProductList});

  @override
  List<Object?> get props => [ProductList];
}

class ProductErrorState extends ProductState {
  final Failures failures;

  ProductErrorState({required this.failures});

  @override
  List<Object?> get props => [failures];
}
