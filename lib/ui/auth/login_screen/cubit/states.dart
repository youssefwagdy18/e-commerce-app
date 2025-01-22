import 'package:e_commerce_app/domain/entities/auth_result_entity.dart';

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