import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/home_categ_or_brand_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/reposatory/data_source/home_brand_data_source.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/home_brand_repo.dart';

class HomeBrandRepoImpl implements HomeBrandRepo{
  HomeBrandDataSource homeBrandDataSource;
  HomeBrandRepoImpl({required this.homeBrandDataSource});
  @override
  Future<Either<FailureEntity, HomeCategOrBrandEntity>> getBrands() {
   return homeBrandDataSource.getBrands();
  }

}