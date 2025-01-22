import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/home_categ_or_brand_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/home_brand_repo.dart';

class HomeBrandUseCase {
  HomeBrandRepo homeBrandRepo;
  HomeBrandUseCase({required this.homeBrandRepo});
  Future<Either<FailureEntity, HomeCategOrBrandEntity>> invoke() {
    return homeBrandRepo.getBrands();
  }
}
