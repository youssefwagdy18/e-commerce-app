import 'package:e_commerce_app/ui/auth/login_screen/login_screen.dart';
import 'package:e_commerce_app/ui/auth/register_screen/register_screen.dart';
import 'package:e_commerce_app/ui/home/home_screen/home_screen_view.dart';
import 'package:e_commerce_app/ui/home/product_details/product_details_screen.dart';
import 'package:e_commerce_app/ui/home/tabs/favourite_tab/favorites_tab.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/product_list_tab.dart';
import 'package:e_commerce_app/ui/home/tabs/profile_tab/profile_tab.dart';
import 'package:e_commerce_app/ui/utils/app_theme.dart';
import 'package:e_commerce_app/ui/utils/bloc_observer.dart';
import 'package:e_commerce_app/ui/utils/shared_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceUtils.init();
  var token = SharedPreferenceUtils.getData(key: 'Token');
  String route;
  if (token == null) {
    route = LoginScreen.routeName;
  } else {
    route = Home.routeName;
  }
  runApp(
    MyApp(route: route),
  );
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  final String route;
  const MyApp({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.mainTheme,
          initialRoute: route,
          routes: {
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            Home.routeName: (context) => const Home(),
            ProductListTab.routeName: (context) => const ProductListTab(),
            FavoritesTab.routeName: (context) => const FavoritesTab(),
            ProfileTab.routeName: (context) => const ProfileTab(),
            ProductDetailsScreen.routeName: (context) => const ProductDetailsScreen()
          },
        );
      },
    );
  }
}
