import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/domain/entities/home_categ_or_brand_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/reposatory/data_source/home_categ_data_source.dart';

class HomeCategDataSourceImpl implements HomeCategDataSource{
  ApiManager apiManager;
  HomeCategDataSourceImpl({required this.apiManager});
  @override
  Future<Either<FailureEntity, HomeCategOrBrandEntity>> getCategories()async {
   var either =await apiManager.getCategories();
   return either.fold((fail){
     return left(fail);
   }, (response){
     return right(response);
   });
  }

}