import 'package:dartz/dartz.dart';
import 'package:ecomtest/src/core/util/error/failures.dart';
import 'package:ecomtest/src/features/home/service/entity/category_entity.dart';
import 'package:ecomtest/src/features/home/service/entity/product_entity.dart';

///home repository abstraction
abstract class HomeDataSource {
  ///get current user data from app
  Future<Either<Failures, List<ProductEntity>>> getProductsList(int offset);

  ///get List of categories
  Future<Either<Failures, List<CategoryEntity>>> getProductCategoryList();

  ///get the wishlist
  Future<Either<Failures, List<ProductEntity>>> getAllUserFavoritesList();

  ///check for a specific product if its in the wishlist
  Future<Either<Failures, bool>> checkUserFavoritesProduct(
      {required ProductEntity product});

  ///set the user's wishlist
  Future<Either<Failures, bool>> setUsersFavorites(
      {required ProductEntity product});
}

///firebase specific data source
abstract class FirebaseHomeDataSource extends HomeDataSource {}
