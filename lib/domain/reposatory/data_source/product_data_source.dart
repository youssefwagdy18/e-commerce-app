import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/product_entity.dart';

abstract class ProductDataSource{
  Future<Either<FailureEntity,ProductEntity>>getProducts();
}