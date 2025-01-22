import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/add_to_cart_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';

abstract class AddToCartRepo{
Future<Either<FailureEntity,AddToCartEntity>>addToCart(String productId);
}