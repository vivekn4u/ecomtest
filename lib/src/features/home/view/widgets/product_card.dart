import 'package:ecomtest/src/core/common/widgets/network_image_with_loader.dart';
import 'package:ecomtest/src/core/util/constant/constants.dart';
import 'package:ecomtest/src/features/home/service/entity/category_entity.dart';
import 'package:ecomtest/src/features/home/service/entity/product_entity.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity? product;
  final VoidCallback press;

  const ProductCard({super.key, this.product, required this.press});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.15,
              child: Stack(
                children: [
                  NetworkImageWithLoader(
                    product!.image?.first ?? "https://i.imgur.com/QkIa5tT.jpeg",
                    radius: defaultBorderRadious,
                  )
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.title!.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 10),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Text(
                    product!.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 12),
                  ),
                  const Spacer(),
                  Text(
                    "\$${product!.price}",
                    style: const TextStyle(
                      color: Color(0xFF31B0D8),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}
