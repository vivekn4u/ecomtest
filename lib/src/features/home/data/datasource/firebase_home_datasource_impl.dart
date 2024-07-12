import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomtest/src/features/login/service/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:ecomtest/src/core/util/error/failures.dart';
import 'package:ecomtest/src/features/home/data/datasource/home_datasource.dart';
import 'package:ecomtest/src/features/home/data/model/category_model.dart';
import 'package:ecomtest/src/features/home/data/model/product_model.dart';
import 'package:ecomtest/src/features/home/service/entity/category_entity.dart';
import 'package:ecomtest/src/features/home/service/entity/product_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: FirebaseHomeDataSource)

///Firebase implementation of home data source
class FirebaseHomeDatasourceImpl extends FirebaseHomeDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  FirebaseHomeDatasourceImpl(
      {required this.firebaseAuth, required this.firebaseFirestore});

  @override
  Future<Either<Failures, List<CategoryEntity>>>
      getProductCategoryList() async {
    try {
      final response = await http
          .get(Uri.parse("https://api.escuelajs.co/api/v1/categories"));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);

        //convert data in list of categories
        List<CategoryEntity> categoryList = jsonResponse.map((k) {
          CategoryEntity category = CategoryModel.fromJson(k) as CategoryEntity;
          return category;
        }).toList();

        return Right(categoryList);
      } else {
        return const Left(ServerFailure(
            message: "Unable to get the categories from server!"));
      }
    } catch (error) {
      return Left(ServerFailure(
          message: "Issue occurred while getting the categories: $error"));
    }
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getProductsList(
      int offset) async {
    try {
      final response = await http.get(Uri.parse(
          "https://api.escuelajs.co/api/v1/products?offset=$offset&limit=20"));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);

        //convert data in list of categories
        List<ProductEntity> categoryList = jsonResponse.map((k) {
          ProductEntity category = ProductModel.fromJson(k) as ProductEntity;
          return category;
        }).toList();

        return Right(categoryList);
      } else {
        return const Left(
            ServerFailure(message: "Unable to get the products from server!"));
      }
    } catch (error) {
      return Left(ServerFailure(
          message: "Issue occurred while getting the products: $error"));
    }
  }

  @override
  Future<Either<Failures, List<ProductEntity>>>
      getAllUserFavoritesList() async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user == null) {
        return const Left(LoginFailure(
            message: "User need to logged in to use this feature!"));
      }
      //get the full product wishlist
      return firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .collection("wishlist")
          .get()
          .then((snapshot) async {
        List<ProductEntity> model = snapshot.docs
            .map((data) => ProductModel.fromFirebase(data))
            .toList();
        return Right(model);
      });
    } catch (error) {
      return Left(ServerFailure(
          message: "Issue occurred while getting the products: $error"));
    }
  }

  @override
  Future<Either<Failures, bool>> checkUserFavoritesProduct(
      {required ProductEntity product}) async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user == null) {
        return const Left(LoginFailure(
            message: "User need to logged in to use this feature!"));
      }
      //get the full product wishlist
      final snapshot = await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .collection("wishlist")
          .doc(product.id.toString())
          .get();
      if (snapshot.exists) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch (error) {
      return Left(ServerFailure(
          message: "Issue occurred while getting the products: $error"));
    }
  }

  @override
  Future<Either<Failures, bool>> setUsersFavorites(
      {required ProductEntity product}) async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user == null) {
        return const Left(LoginFailure(
            message: "User need to logged in to use this feature!"));
      }
      //get the full product wishlist
      final snapshot = await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .collection("wishlist")
          .doc(product.id.toString())
          .get();
      if (snapshot.exists) {
        await firebaseFirestore
            .collection("users")
            .doc(user.uid)
            .collection("wishlist")
            .doc(product.id.toString())
            .delete();
        return const Right(false);
      } else {
        await firebaseFirestore
            .collection("users")
            .doc(user.uid)
            .collection("wishlist")
            .doc(product.id.toString())
            .set((product as ProductModel).toJson());
        return const Right(true);
      }
    } catch (error) {
      return Left(ServerFailure(
          message: "Issue occurred while getting the products: $error"));
    }
  }
}
