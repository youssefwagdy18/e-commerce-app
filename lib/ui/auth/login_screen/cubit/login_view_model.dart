import 'package:e_commerce_app/domain/use_case/login_use_case.dart';
import 'package:e_commerce_app/ui/auth/login_screen/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<LoginStates>{
  LoginViewModel({required this.loginUseCase}) : super (LoginInitialState());
  LoginUseCase loginUseCase;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  bool isObscure = true;
  void login() async {
    emit(LoginLoadingState());
    var either= await loginUseCase.invoke(passwordController.text, userNameController.text);
    either.fold(
        (fail){
          emit(LoginErrorState(errorMsg: fail.errorMsg));
        }
    , (response){
          emit(LoginSuccessState(authResultEntity: response));
    });
  }
}