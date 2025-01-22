import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/add_to_cart_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/add_to_cart_repo.dart';

class AddToCartUseCase{
  AddToCartRepo addToCartRepo;
  AddToCartUseCase({required this.addToCartRepo});
  Future<Either<FailureEntity,AddToCartEntity>>invoke(String productId)async{
    var either =await addToCartRepo.addToCart(productId);
    return either.fold((fail){
      return left(fail);
    }, (response){
      return right(response);
    });
  }
}