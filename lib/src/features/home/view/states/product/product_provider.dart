import 'package:ecomtest/src/core/common/services/service_locator.dart';
import 'package:ecomtest/src/features/home/view/states/product/product_state_notifier.dart';
import 'package:ecomtest/src/features/home/view/states/product/product_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef ProductProvider
    = StateNotifierProvider<ProductStateNotifier, ProductState>;

/// A [StateNotifierProvider] which provides [ProductState] to [ConsumerWidget]
///
final productProvider = ProductProvider((ref) => sl<ProductStateNotifier>());
