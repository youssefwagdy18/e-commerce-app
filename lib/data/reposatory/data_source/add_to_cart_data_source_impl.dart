import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/domain/entities/add_to_cart_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/reposatory/data_source/add_to_cart_data_source.dart';

class AddToCartDataSourceImpl implements AddToCartDataSource{
  ApiManager apiManager;
  AddToCartDataSourceImpl({required this.apiManager});
  @override
  Future<Either<FailureEntity, AddToCartEntity>> addToCart(String productId)async {
    var either =await apiManager.addToCart(productId);
    return either.fold((fail){
      return left(fail);
    }, (response){
      return right(response);
    });
  }

}