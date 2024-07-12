// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:ecomtest/src/core/common/modules/injectable_modules.dart'
    as _i17;
import 'package:ecomtest/src/features/home/data/datasource/firebase_home_datasource_impl.dart'
    as _i7;
import 'package:ecomtest/src/features/home/data/datasource/home_datasource.dart'
    as _i6;
import 'package:ecomtest/src/features/home/data/repository/home_repository_impl.dart'
    as _i11;
import 'package:ecomtest/src/features/home/service/repository/home_repository.dart'
    as _i10;
import 'package:ecomtest/src/features/home/service/usecases/get_categories_impl.dart'
    as _i15;
import 'package:ecomtest/src/features/home/service/usecases/get_products_impl.dart'
    as _i13;
import 'package:ecomtest/src/features/home/service/usecases/home_usecases.dart'
    as _i12;
import 'package:ecomtest/src/features/home/view/states/category/category_state_notifier.dart'
    as _i16;
import 'package:ecomtest/src/features/home/view/states/product/product_state_notifier.dart'
    as _i14;
import 'package:ecomtest/src/features/login/data/repository/login_repository_impl.dart'
    as _i9;
import 'package:ecomtest/src/features/login/service/repository/login_repository.dart'
    as _i8;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModules = _$InjectionModules();
    gh.factory<_i3.Client>(() => injectionModules.clientHttp);
    gh.factory<_i4.FirebaseFirestore>(() => injectionModules.firebaseFireStore);
    gh.factory<_i5.FirebaseAuth>(() => injectionModules.firebaseAuth);
    gh.lazySingleton<_i6.FirebaseHomeDataSource>(
        () => _i7.FirebaseHomeDatasourceImpl(
              firebaseAuth: gh<_i5.FirebaseAuth>(),
              firebaseFirestore: gh<_i4.FirebaseFirestore>(),
            ));
    gh.lazySingleton<_i8.LoginRepository>(() => _i9.LoginRepositoryImpl());
    gh.lazySingleton<_i10.HomeRepository>(() => _i11.HomeRepositoryImpl(
        firebaseHomeDataSource: gh<_i6.FirebaseHomeDataSource>()));
    gh.lazySingleton<_i12.GetProducts>(
        () => _i13.GetProductsImpl(homeRepository: gh<_i10.HomeRepository>()));
    gh.lazySingleton<_i14.ProductStateNotifier>(
        () => _i14.ProductStateNotifier(getProducts: gh<_i12.GetProducts>()));
    gh.lazySingleton<_i12.GetCategories>(() =>
        _i15.GetCategoriesImpl(homeRepository: gh<_i10.HomeRepository>()));
    gh.lazySingleton<_i16.CategoryStateNotifier>(() =>
        _i16.CategoryStateNotifier(getCategories: gh<_i12.GetCategories>()));
    return this;
  }
}

class _$InjectionModules extends _i17.InjectionModules {}
