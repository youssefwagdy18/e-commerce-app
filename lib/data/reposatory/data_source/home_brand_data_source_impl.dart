import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/domain/entities/home_categ_or_brand_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/reposatory/data_source/home_brand_data_source.dart';

class HomeBrandDataSourceImpl implements HomeBrandDataSource {
  ApiManager apiManager;
  HomeBrandDataSourceImpl({required this.apiManager});
  @override
  Future<Either<FailureEntity, HomeCategOrBrandEntity>> getBrands() async {
    var either = await apiManager.getBrands();
    return either.fold((l) {
      return left(l);
    }, (response) {
      return right(response);
    });
  }
}
