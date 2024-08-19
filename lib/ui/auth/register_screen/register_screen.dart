import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/auth/login_screen/login_screen.dart';
import 'package:e_commerce_app/ui/auth/register_screen/cubit/register_view_model.dart';
import 'package:e_commerce_app/ui/auth/register_screen/cubit/states.dart';
import 'package:e_commerce_app/ui/utils/appColors.dart';
import 'package:e_commerce_app/ui/utils/customized_text_form_field.dart';
import 'package:e_commerce_app/ui/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register page';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterViewModel viewModel =
      RegisterViewModel(registerUseCase: injectableUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context);
        } else if (state is RegisterOnErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              contentMsg: state.errorMsg!,
              posActionName: 'ok');
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              contentMsg:
                  "${state.authResultEntity.userEntity?.name ?? ''} is already registered successfully!",
              posActionName: 'ok',
          posAction: (){
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          });
        }
      },
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
                            CustomizedTextFormField(
                              controller: viewModel.fullNameController,
                              fieldName: 'Full Name',
                              keyboardType: TextInputType.text,
                              hintText: 'Enter Full Name ',
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter your full name';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            CustomizedTextFormField(
                              controller: viewModel.emailController,
                              fieldName: 'Email Address',
                              keyboardType: TextInputType.emailAddress,
                              hintText: 'Enter Email Address',
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
                                  return 'please enter your password here';
                                } else if (value.trim().length < 6 ||
                                    value.trim().length > 15) {
                                  return 'enter your password between 6 to 15 numbers';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            CustomizedTextFormField(
                              controller: viewModel.rePasswordController,
                              fieldName: 'Re-Password',
                              keyboardType: TextInputType.number,
                              hintText: 'Enter Re-Password',
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
                                  return 'please enter your re-password here';
                                } else if (value !=
                                    viewModel.passwordController.text) {
                                  return 'please enter the same password';
                                } else if (value.trim().length < 6 ||
                                    value.trim().length > 15) {
                                  return 'enter your password between 6 to 15 numbers';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            CustomizedTextFormField(
                              controller: viewModel.mobileNumberController,
                              fieldName: 'Mobile Number',
                              keyboardType: TextInputType.phone,
                              hintText: 'Enter Mobile Number',
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter your mobile number here';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 56.h,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                viewModel.register();
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
                                    'Sign Up',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 89.h,)
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
      ),
    );
  }
}
