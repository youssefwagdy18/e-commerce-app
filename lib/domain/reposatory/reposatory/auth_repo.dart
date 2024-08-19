import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';

abstract class AuthRepo {
  Future<Either<FailureEntity, AuthResultEntity>> register(String name,
      String password, String rePassword, String phoneNumber, String email);

  Future<Either<FailureEntity, AuthResultEntity>> login(
      String password, String email);
}
