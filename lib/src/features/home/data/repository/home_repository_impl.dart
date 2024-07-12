import 'package:dartz/dartz.dart';
import 'package:ecomtest/src/core/util/error/failures.dart';
import 'package:ecomtest/src/features/home/data/datasource/home_datasource.dart';
import 'package:ecomtest/src/features/home/service/entity/category_entity.dart';
import 'package:ecomtest/src/features/home/service/entity/product_entity.dart';
import 'package:ecomtest/src/features/home/service/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)

///Implementation of home repositories
class HomeRepositoryImpl extends HomeRepository {
  final FirebaseHomeDataSource firebaseHomeDataSource;

  HomeRepositoryImpl({required this.firebaseHomeDataSource});

  @override
  Future<Either<Failures, bool>> checkUserFavoritesProduct(
      {required ProductEntity product}) {
    return firebaseHomeDataSource.checkUserFavoritesProduct(product: product);
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getAllUserFavoritesList() {
    return firebaseHomeDataSource.getAllUserFavoritesList();
  }

  @override
  Future<Either<Failures, List<CategoryEntity>>> getProductCategoryList() {
    return firebaseHomeDataSource.getProductCategoryList();
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getProductsList(int offset) {
    return firebaseHomeDataSource.getProductsList(offset);
  }

  @override
  Future<Either<Failures, bool>> setUsersFavorites(
      {required ProductEntity product}) {
    return firebaseHomeDataSource.setUsersFavorites(product: product);
  }
}
