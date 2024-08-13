import 'dart:async';
import 'package:e_commerce_app/ui/auth/login_screen/login_screen.dart';
import 'package:e_commerce_app/ui/auth/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash_screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4),() => Navigator.pushReplacementNamed((context),LoginScreen.routeName));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/images/splash_image.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,),
    );
  }
}
