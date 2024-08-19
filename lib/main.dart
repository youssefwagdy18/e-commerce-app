import 'package:e_commerce_app/ui/auth/login_screen/login_screen.dart';
import 'package:e_commerce_app/ui/auth/register_screen/register_screen.dart';
import 'package:e_commerce_app/ui/home/home_screen/home_screen_view.dart';
import 'package:e_commerce_app/ui/home/tabs/favourite_tab/favorites_tab.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/product_list_tab.dart';
import 'package:e_commerce_app/ui/home/tabs/profile_tab/profile_tab.dart';
import 'package:e_commerce_app/ui/splash/splash_screen.dart';
import 'package:e_commerce_app/ui/utils/appTheme.dart';
import 'package:e_commerce_app/ui/utils/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){
  runApp(const MyApp());
  Bloc.observer=MyBlocObserver();
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
            LoginScreen.routeName :(context) =>  const LoginScreen(),
            Home.routeName :(context) =>  const Home(),
            ProductListTab.routeName :(context) =>  const ProductListTab(),
            FavoritesTab.routeName :(context) =>  const FavoritesTab(),
            ProfileTab.routeName :(context) =>  const ProfileTab(),
          },
        );
      },

    );
  }
}
