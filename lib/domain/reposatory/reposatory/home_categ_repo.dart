import 'package:dartz/dartz.dart';
import '../../entities/home_categ_or_brand_entity.dart';
import '../../entities/failures.dart';

abstract class HomeCategRepo {
  Future<Either<FailureEntity, HomeCategOrBrandEntity>> getCategories();
}
