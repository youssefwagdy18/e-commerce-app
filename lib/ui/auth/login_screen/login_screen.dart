import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/auth/login_screen/cubit/login_view_model.dart';
import 'package:e_commerce_app/ui/auth/login_screen/cubit/states.dart';
import 'package:e_commerce_app/ui/auth/register_screen/register_screen.dart';
import 'package:e_commerce_app/ui/home/home_screen/home_screen_view.dart';
import 'package:e_commerce_app/ui/utils/appColors.dart';
import 'package:e_commerce_app/ui/utils/customized_text_form_field.dart';
import 'package:e_commerce_app/ui/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login page';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = LoginViewModel(loginUseCase: injectableLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        listener: (context, state) {
          if(state is LoginLoadingState){
           DialogUtils.showLoading(context);
          }if (state is LoginSuccessState){
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context: context, contentMsg:
            "${state.authResultEntity!.userEntity!.name!} is Successfully sign up",
            posAction: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Home()));
            },
            posActionName: 'Ok');
          }if(state is LoginErrorState){
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context: context, contentMsg: state.errorMsg!);
          }
        },
        bloc: viewModel,
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 85.h, right: 96.w, left: 96.w, bottom: 45.h),
                    child: Image.asset('assets/images/Vector.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Form(
                          key: viewModel.formKey,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Welcome back to route',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      Text(
                                        'please sign in with your e-mail',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 32.h,
                              ),
                              CustomizedTextFormField(
                                controller: viewModel.userNameController,
                                fieldName: 'User Name',
                                keyboardType: TextInputType.emailAddress,
                                hintText: 'Enter User Name',
                                obscureText: false,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'please enter your Email address here';
                                  } else if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                    return 'please enter correct Email';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: 32.h,
                              ),
                              CustomizedTextFormField(
                                controller: viewModel.passwordController,
                                fieldName: 'Password',
                                keyboardType: TextInputType.number,
                                hintText: 'Enter Password',
                                obscureText: viewModel.isObscure,
                                suffixIcon: GestureDetector(
                                  child: viewModel.isObscure == true
                                      ? const Icon(Icons.visibility_off,
                                          color: AppColors.darkPrimaryColor)
                                      : const Icon(Icons.visibility,
                                          color: AppColors.darkPrimaryColor),
                                  onTap: () {
                                    viewModel.isObscure == false
                                        ? viewModel.isObscure = true
                                        : viewModel.isObscure = false;
                                    setState(() {});
                                  },
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'please enter your mobile number here';
                                  } else if (value.trim().length < 8 ||
                                      value.trim().length > 15) {
                                    return 'enter your password between 8 to 15 numbers';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      ///todo for forget password
                                    },
                                    child: Text(
                                      'Forget password',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 56.h,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  viewModel.login();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                ),
                                child: SizedBox(
                                  height: 64.h,
                                  width: 398.w,
                                  child: Center(
                                    child: Text(
                                      'Login',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 32.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterScreen()));
                                },
                                child: Center(
                                  child: Text(
                                    "Don't have an account? Create Account",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
