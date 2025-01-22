import 'package:e_commerce_app/domain/entities/add_to_cart_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/product_entity.dart';

abstract class ProductStates{}
class InitialProductState extends ProductStates{}

class SuccessProductState extends ProductStates{
  ProductEntity? productEntity;
  SuccessProductState({required this.productEntity});
}
class FailureProductState extends ProductStates{
  FailureEntity? failureEntity;
  FailureProductState({required this.failureEntity});
}
class LoadingProductState extends ProductStates{
  String? loading;
  LoadingProductState({required this.loading});
}


class AddToCartLoadingState extends ProductStates{
  String? loading;
  AddToCartLoadingState({required this.loading});
}
class AddToCartFailureState extends ProductStates{
  FailureEntity? failureEntity;
  AddToCartFailureState({required this.failureEntity});
}
class AddToCartSuccessState extends ProductStates{
  AddToCartEntity? addToCartEntity;
  AddToCartSuccessState({required this.addToCartEntity});
}

