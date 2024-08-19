import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';

abstract class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  AuthResultEntity? authResultEntity;
  LoginSuccessState({required this.authResultEntity});
}
class LoginErrorState extends LoginStates{
  String? errorMsg;
  LoginErrorState({required this.errorMsg});
}