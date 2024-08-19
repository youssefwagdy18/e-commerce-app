import 'package:e_commerce_app/domain/use_case/register_use_case.dart';
import 'package:e_commerce_app/ui/auth/register_screen/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  //todo hold data - manage logic
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  bool isObscure = true;
  RegisterUseCase registerUseCase;

  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        fullNameController.text,
        passwordController.text,
        rePasswordController.text,
        mobileNumberController.text,
        emailController.text);
    either.fold(
      (fail) => emit(RegisterOnErrorState(errorMsg: fail.errorMsg)),
      (response) => emit(
        RegisterSuccessState(authResultEntity: response),
      ),
    );
  }
}
