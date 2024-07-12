import 'package:ecomtest/src/core/util/error/failures.dart';
import 'package:ecomtest/src/features/home/service/entity/category_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryCompletedState extends CategoryState {
  final List<CategoryEntity>? categoryList;

  CategoryCompletedState({required this.categoryList});

  @override
  List<Object?> get props => [categoryList];
}

class CategoryErrorState extends CategoryState {
  final Failures failures;

  CategoryErrorState({required this.failures});

  @override
  List<Object?> get props => [failures];
}
