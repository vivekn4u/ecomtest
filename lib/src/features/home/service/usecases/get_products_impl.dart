import 'package:dartz/dartz.dart';
import 'package:ecomtest/src/core/util/error/failures.dart';
import 'package:ecomtest/src/core/util/usecase/usecase.dart';
import 'package:ecomtest/src/features/home/service/entity/product_entity.dart';
import 'package:ecomtest/src/features/home/service/repository/home_repository.dart';
import 'package:ecomtest/src/features/home/service/usecases/home_usecases.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GetProducts)
class GetProductsImpl extends GetProducts {
  final HomeRepository homeRepository;

  GetProductsImpl({required this.homeRepository});

  @override
  Future<Either<Failures, List<ProductEntity>?>>? call(OffsetParams params) {
    return homeRepository.getProductsList(params.offset!);
  }
}
