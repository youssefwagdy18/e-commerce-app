import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/reposatory/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<FailureEntity, AuthResultEntity>> register(String name,
      String password, String rePassword, String phoneNumber, String email) {
    return authRemoteDataSource.register(
        name, password, rePassword, phoneNumber, email);
  }

  @override
  Future<Either<FailureEntity, AuthResultEntity>> login(String password, String email) {
    return authRemoteDataSource.login(password, email);
  }
}
