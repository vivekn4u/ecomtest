import 'package:dartz/dartz.dart';
import 'package:ecomtest/src/core/util/error/failures.dart';
import 'package:ecomtest/src/core/util/usecase/usecase.dart';
import 'package:ecomtest/src/features/home/service/entity/category_entity.dart';
import 'package:ecomtest/src/features/home/service/repository/home_repository.dart';
import 'package:ecomtest/src/features/home/service/usecases/home_usecases.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GetCategories)
class GetCategoriesImpl extends GetCategories {
  final HomeRepository homeRepository;

  GetCategoriesImpl({required this.homeRepository});

  @override
  Future<Either<Failures, List<CategoryEntity>?>>? call(NoParams params) {
    return homeRepository.getProductCategoryList();
  }
}
