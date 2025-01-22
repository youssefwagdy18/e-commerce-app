//todo viewModel => object of useCase
//todo useCase => object of reposatory
//todo reposatory => object of dataSource
//todo dataSource => object of ApiManager

import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/data/reposatory/data_source/add_to_cart_data_source_impl.dart';
import 'package:e_commerce_app/data/reposatory/data_source/home_brand_data_source_impl.dart';
import 'package:e_commerce_app/data/reposatory/data_source/home_categ_data_source_impl.dart';
import 'package:e_commerce_app/data/reposatory/data_source/product_data_source_impl.dart';
import 'package:e_commerce_app/data/reposatory/data_source/remote_data_source_impl.dart';
import 'package:e_commerce_app/data/reposatory/reposatory/add_to_cart_repo_impl.dart';
import 'package:e_commerce_app/data/reposatory/reposatory/auth_repo_impl.dart';
import 'package:e_commerce_app/data/reposatory/reposatory/home_brand_repo_impl.dart';
import 'package:e_commerce_app/data/reposatory/reposatory/home_categ_repo_impl.dart';
import 'package:e_commerce_app/data/reposatory/reposatory/product_repo_impl.dart';
import 'package:e_commerce_app/domain/reposatory/data_source/add_to_cart_data_source.dart';
import 'package:e_commerce_app/domain/reposatory/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/reposatory/data_source/home_brand_data_source.dart';
import 'package:e_commerce_app/domain/reposatory/data_source/home_categ_data_source.dart';
import 'package:e_commerce_app/domain/reposatory/data_source/product_data_source.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/add_to_cart_repo.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/auth_repo.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/home_brand_repo.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/home_categ_repo.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/product_repo.dart';
import 'package:e_commerce_app/domain/use_case/add_to_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_case/home_brand_use_case.dart';
import 'package:e_commerce_app/domain/use_case/home_categ_use_case.dart';
import 'package:e_commerce_app/domain/use_case/login_use_case.dart';
import 'package:e_commerce_app/domain/use_case/products_use_case.dart';
import 'package:e_commerce_app/domain/use_case/register_use_case.dart';

RegisterUseCase injectableUseCase(){
  return RegisterUseCase(authRepo: injectableAuthRepo());
}
AuthRepo injectableAuthRepo(){
  return AuthRepoImpl(authRemoteDataSource: injectableAuthDataSource());
}
AuthRemoteDataSource injectableAuthDataSource(){
  return RemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}


LoginUseCase injectableLoginUseCase(){
  return LoginUseCase(authRepo: injectableAuthRepo());
}
AuthRepo injectableLoginAuthRepo(){
  return AuthRepoImpl(authRemoteDataSource: injectableAuthDataSource());
}
AuthRemoteDataSource injectableLoginAuthDataSource(){
  return RemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

ApiManager injectableApiManager(){
  return ApiManager.getInstance();
}

HomeCategDataSource injectableCategDataSource(){
  return HomeCategDataSourceImpl(apiManager: injectableApiManager());
}

HomeCategRepo injectableCategRepo(){
  return HomeCategRepoImpl(homeCategDataSource: injectableCategDataSource());
}

HomeCategUseCase injectableCategUseCase(){
  return HomeCategUseCase(homeCategRepo: injectableCategRepo());
}

HomeBrandUseCase injectableBrandUseCase(){
  return HomeBrandUseCase(homeBrandRepo: injectableBrandRepo());
}

 HomeBrandRepo injectableBrandRepo(){
  return HomeBrandRepoImpl(homeBrandDataSource: injectableBrandDataSource());
 }
 HomeBrandDataSource injectableBrandDataSource(){
  return HomeBrandDataSourceImpl(apiManager: injectableApiManager());
 }


 ProductDataSource injectableProductDataSource(){
  return ProductDataSourceImpl(apiManager: injectableApiManager());
 }

 ProductRepo injectableProductRepo(){
  return ProductRepoImpl(productDataSource: injectableProductDataSource());
 }

 ProductsUseCase injectableProductUseCase(){
  return ProductsUseCase(productRepo: injectableProductRepo());
 }

 AddToCartDataSource injectableAddToCartDataSource(){
  return AddToCartDataSourceImpl(apiManager: injectableApiManager());
 }
 AddToCartRepo injectableAddToCartRepo(){
  return AddToCartRepoImpl(addToCartDataSource: injectableAddToCartDataSource());
 }
 AddToCartUseCase injectableAddToCartUseCase(){
  return AddToCartUseCase(addToCartRepo: injectableAddToCartRepo());
}