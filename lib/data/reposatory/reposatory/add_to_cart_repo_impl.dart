import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/add_to_cart_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/add_to_cart_repo.dart';

import '../../../domain/reposatory/data_source/add_to_cart_data_source.dart';

class AddToCartRepoImpl implements AddToCartRepo {
  AddToCartDataSource addToCartDataSource;
  AddToCartRepoImpl({required this.addToCartDataSource});
  @override
  Future<Either<FailureEntity, AddToCartEntity>> addToCart(String productId) {
    return addToCartDataSource.addToCart(productId);
  }
}
