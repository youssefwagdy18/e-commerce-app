import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/reposatory/data_source/auth_remote_data_source.dart';

class RemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  RemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<FailureEntity, AuthResultEntity>> register(
      String name,
      String password,
      String rePassword,
      String phoneNumber,
      String email) async {
    var either = await apiManager.registerAuth(
        name, password, rePassword, phoneNumber, email);
    return either.fold(
      (fail) {
        return left(fail);
      },
      (response) {
        return right(response.toRegisterResponseDto());
      },
    );
  }

  @override
  Future<Either<FailureEntity, AuthResultEntity>> login(String password, String email)async {
    var either =await apiManager.loginAuth(password, email);
    return either.fold(
        (fail){
          return left(fail);
        },
        (response){
          return right(response.toLoginResponseDto());
        }
    );

  }
}
