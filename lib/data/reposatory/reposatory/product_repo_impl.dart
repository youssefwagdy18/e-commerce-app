import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/product_entity.dart';
import 'package:e_commerce_app/domain/reposatory/data_source/product_data_source.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/product_repo.dart';

class ProductRepoImpl implements ProductRepo{
  ProductDataSource productDataSource;
  ProductRepoImpl({required this.productDataSource});
  @override
  Future<Either<FailureEntity, ProductEntity>> getProducts() async{
    return  productDataSource.getProducts();
  }

}