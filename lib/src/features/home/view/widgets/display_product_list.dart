import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomtest/src/core/common/widgets/error_page.dart';
import 'package:ecomtest/src/core/common/widgets/loading_page.dart';
import 'package:ecomtest/src/features/home/service/entity/product_entity.dart';
import 'package:ecomtest/src/features/home/view/pages/product_detail_screen.dart';
import 'package:ecomtest/src/features/home/view/states/product/product_provider.dart';
import 'package:ecomtest/src/features/home/view/states/product/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductListWidget extends HookConsumerWidget {
  ProductListWidget({super.key});

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productProvider);
    if (productState is ProductCompletedState) {
      //TODO : need to implement pagination
      final pageOffcet = useState(0);
      //get the product list
      List<ProductEntity>? products = productState.ProductList;
      return ListView.builder(
          controller: _scrollController,
          itemCount: products!.length,
          itemBuilder: (context, index) {
            ProductEntity product = products.elementAt(index);
            return ListTile(
              onTap: () {
                context.goNamed(ProductDetailScreen.route,
                    queryParameters: <String, ProductEntity>{
                      'product': product,
                    });
              },
              leading: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 64,
                ),
                child: CachedNetworkImage(imageUrl: product.image!.first),
              ),
              title: Text(product.title!),
            );
          });
    } else if (productState is ProductErrorState) {
      return ErrorPage(
        message: productState.failures.message,
      );
    } else {
      return const ProgressIndicatorWidget();
    }
  }
}
