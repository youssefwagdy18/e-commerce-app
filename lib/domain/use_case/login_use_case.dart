import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/auth_repo.dart';
import '../entities/AuthResultEntity.dart';
import '../entities/failures.dart';

class LoginUseCase {
  AuthRepo authRepo;
  LoginUseCase({required this.authRepo});

  Future<Either<FailureEntity, AuthResultEntity>>invoke(String password, String email){
    return authRepo.login(password, email);
  }
}