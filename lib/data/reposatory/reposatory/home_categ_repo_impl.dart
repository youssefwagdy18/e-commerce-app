import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/home_categ_or_brand_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/reposatory/data_source/home_categ_data_source.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/home_categ_repo.dart';

class HomeCategRepoImpl extends HomeCategRepo{
  HomeCategDataSource homeCategDataSource;
  HomeCategRepoImpl({required this.homeCategDataSource});
  @override
  Future<Either<FailureEntity, HomeCategOrBrandEntity>> getCategories() {
    return homeCategDataSource.getCategories();
  }

}