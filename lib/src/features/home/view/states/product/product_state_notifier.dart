import 'package:ecomtest/src/core/common/services/service_locator.dart';
import 'package:ecomtest/src/core/util/error/failures.dart';
import 'package:ecomtest/src/core/util/usecase/usecase.dart';
import 'package:ecomtest/src/features/home/service/usecases/home_usecases.dart';
import 'package:ecomtest/src/features/home/view/states/product/product_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductStateNotifier extends StateNotifier<ProductState> {
  final GetProducts getProducts;

  ProductStateNotifier({required this.getProducts})
      : super(ProductInitialState()) {
    notifyProducts(0);
  }

  void notifyProducts(int offset) {
    try {
      state = ProductLoadingState();
      getProducts(OffsetParams(offset: offset))?.then((data) {
        data.fold((l) => state = ProductErrorState(failures: l),
            (r) => state = ProductCompletedState(ProductList: r));
      });
    } on Exception {
      state = ProductErrorState(
          failures: const ServerFailure(message: "Error: Product Not Found!!"));
    }
  }
}
