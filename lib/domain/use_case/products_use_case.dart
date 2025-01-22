import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/product_entity.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/product_repo.dart';

class ProductsUseCase{
  ProductsUseCase({required this.productRepo});
  ProductRepo productRepo;
  Future<Either<FailureEntity,ProductEntity>>invoke()async{
    var either =await productRepo.getProducts();
    return either.fold((l) {
      return left(l);
    }, (response){
      return right(response);
    });
  }
}