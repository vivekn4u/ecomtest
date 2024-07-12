import 'package:ecomtest/src/features/home/data/model/product_model.dart';
import 'package:ecomtest/src/features/home/service/entity/product_entity.dart';
import 'package:ecomtest/src/features/home/view/widgets/display_product_list.dart';
import 'package:ecomtest/src/features/home/view/widgets/product_card.dart';
import 'package:flutter/material.dart';

///this page is a widget to display home screen
class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  static const route = '/';

  // ProductEntity product = ProductModel.fromJson(const {
  //   "id": 11,
  //   "title": "Classic Red Baseball Cap",
  //   "price": 35,
  //   "description":
  //       "Elevate your casual wardrobe with this timeless red baseball cap. Crafted from durable fabric, it features a comfortable fit with an adjustable strap at the back, ensuring one size fits all. Perfect for sunny days or adding a sporty touch to your outfit.",
  //   "images": [
  //     "https://i.imgur.com/cBuLvBi.jpeg",
  //     "https://i.imgur.com/N1GkCIR.jpeg",
  //     "https://i.imgur.com/kKc9A5p.jpeg"
  //   ],
  //   "creationAt": "2024-07-12T00:39:35.000Z",
  //   "updatedAt": "2024-07-12T00:39:35.000Z",
  //   "category": {
  //     "id": 1,
  //     "name": "Evan",
  //     "image": "https://example.com/image1.jpg",
  //     "creationAt": "2024-07-12T00:39:35.000Z",
  //     "updatedAt": "2024-07-12T01:21:20.000Z"
  //   }
  // }) as ProductEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: ProductCard(
        //   product: product,
        //   press: () {},
        // ),
        body: ProductListWidget(),
      ),
    );
  }
}
