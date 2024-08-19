import 'package:e_commerce_app/ui/home/home_screen/widget/customized_bottom_navigation_bar.dart';
import 'package:e_commerce_app/ui/home/tabs/favourite_tab/favorites_tab.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/home_tab.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/product_list_tab.dart';
import 'package:e_commerce_app/ui/home/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String routeName = 'home_screen_view';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex =0;
  List<Widget>tabs=[
    const HomeTab(),
    const ProductListTab(),
    FavoritesTab(),
    ProfileTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customizedBottomNavigationBar(
          selectedIndex: selectedIndex,
          onTapFunction: (index){
            setState(() {
              selectedIndex = index;
            });
          },
          context: context),
      body: tabs[selectedIndex],
    );
  }
}
