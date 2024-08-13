import 'package:e_commerce_app/ui/auth/register_screen/register_screen.dart';
import 'package:e_commerce_app/ui/utils/colors.dart';
import 'package:e_commerce_app/ui/utils/customized_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'register page';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment:MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Welcome back to route',
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text('please sign in with your e-mail',
                                    style: Theme.of(context).textTheme.titleMedium,)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          CustomizedTextFormField(
                            controller: userNameController,
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
                            controller: passwordController,
                            fieldName: 'Password',
                            keyboardType: TextInputType.number,
                            hintText: 'Enter Password',
                            obscureText: isObscure,
                            suffixIcon: GestureDetector(
                              child: isObscure == true
                                  ? const Icon(Icons.visibility_off,
                                      color: AppColors.darkPrimaryColor)
                                  : const Icon(Icons.visibility,
                                      color: AppColors.darkPrimaryColor),
                              onTap: () {
                                isObscure == false
                                    ? isObscure = true
                                    : isObscure = false;
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
                          SizedBox(height: 16.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  ///todo for forget password
                                },
                                child: Text(
                                  'Forget password',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 56.h,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              ///todo login
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
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 32.h,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>const RegisterScreen()));
                            },
                            child: Center(
                              child: Text("Don't have an account? Create Account",
                              style: Theme.of(context).textTheme.titleMedium,),
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
    );
  }
}
