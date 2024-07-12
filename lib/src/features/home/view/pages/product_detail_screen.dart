import 'package:ecomtest/src/features/home/service/entity/product_entity.dart';
import 'package:ecomtest/src/features/home/view/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.productEntity});

  final ProductEntity productEntity;

  static const route = 'product-detail';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ProductCard(
        product: productEntity,
        press: () {},
      ),
    ));
  }
}
