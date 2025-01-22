import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/entities/product_entity.dart';
import 'package:e_commerce_app/domain/reposatory/data_source/product_data_source.dart';

class ProductDataSourceImpl implements ProductDataSource{
  ApiManager apiManager;
  ProductDataSourceImpl({required this.apiManager});
  @override
  Future<Either<FailureEntity, ProductEntity>> getProducts() async{
    var either = await apiManager.getProducts();
    return either.fold((fail){
      return left(fail);
    }, (response){
      return right(response);
    });
  }

}