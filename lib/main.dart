import 'package:e_commerce_app/ui/auth/login_screen/login_screen.dart';
import 'package:e_commerce_app/ui/auth/register_screen/register_screen.dart';
import 'package:e_commerce_app/ui/splash/splash_screen.dart';
import 'package:e_commerce_app/ui/utils/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.mainTheme,
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName :(context) => const SplashScreen(),
            RegisterScreen.routeName :(context) =>const RegisterScreen(),
            LoginScreen.routeName :(context) => const LoginScreen(),
          },
        );
      },

    );
  }
}
