import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/home_categ_or_brand_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';

abstract class HomeCategDataSource {
  Future<Either<FailureEntity, HomeCategOrBrandEntity>> getCategories();
}
