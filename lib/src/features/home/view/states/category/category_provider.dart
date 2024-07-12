import 'package:ecomtest/src/core/common/services/service_locator.dart';
import 'package:ecomtest/src/features/home/view/states/category/category_state_notifier.dart';
import 'package:ecomtest/src/features/home/view/states/category/category_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef CategoryProvider
    = StateNotifierProvider<CategoryStateNotifier, CategoryState>;

/// A [StateNotifierProvider] which provides [CategoryState] to [ConsumerWidget]
///
final categoryProvider = CategoryProvider((ref) => sl<CategoryStateNotifier>());
