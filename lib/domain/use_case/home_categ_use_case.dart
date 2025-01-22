import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/home_categ_or_brand_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/home_categ_repo.dart';

class HomeCategUseCase {
  HomeCategRepo homeCategRepo;
  HomeCategUseCase({required this.homeCategRepo});

  Future<Either<FailureEntity, HomeCategOrBrandEntity>> invoke() {
    return homeCategRepo.getCategories();
  }
}
