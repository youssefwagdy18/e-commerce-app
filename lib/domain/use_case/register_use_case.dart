import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/auth_repo.dart';

class RegisterUseCase {
//todo Logic functions which have been called from reposatory depending on data source of abstract classes
  AuthRepo authRepo;
  RegisterUseCase({required this.authRepo});
  Future<Either<FailureEntity, AuthResultEntity>> invoke(
      String name,
      String password,
      String rePassword,
      String phoneNumber,
      String email) {
    return authRepo.register(name, password, rePassword, phoneNumber, email);
  }
}
