import 'package:ecomtest/src/core/util/error/failures.dart';
import 'package:ecomtest/src/core/util/usecase/usecase.dart';
import 'package:ecomtest/src/features/home/service/usecases/home_usecases.dart';
import 'package:ecomtest/src/features/home/view/states/category/category_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CategoryStateNotifier extends StateNotifier<CategoryState> {
  final GetCategories getCategories;

  CategoryStateNotifier({required this.getCategories})
      : super(CategoryInitialState());

  void notifyCategories() {
    try {
      state = CategoryLoadingState();
      getCategories(NoParams())?.then((data) {
        data.fold((l) => state = CategoryErrorState(failures: l),
            (r) => state = CategoryCompletedState(categoryList: r));
      });
    } on Exception {
      state = CategoryErrorState(
          failures: const ServerFailure(message: "Error: Product Not Found!!"));
    }
  }
}
