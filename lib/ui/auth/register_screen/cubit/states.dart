import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{
  AuthResultEntity authResultEntity;
  RegisterSuccessState({required this.authResultEntity});
}

class RegisterOnErrorState extends RegisterStates{
  String? errorMsg;
  RegisterOnErrorState({required this.errorMsg});
}
