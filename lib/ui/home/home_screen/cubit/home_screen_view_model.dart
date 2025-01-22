import 'package:e_commerce_app/ui/home/home_screen/cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../tabs/favourite_tab/favorites_tab.dart';
import '../../tabs/home_tab/home_tab.dart';
import '../../tabs/product_list_tab/product_list_tab.dart';
import '../../tabs/profile_tab/profile_tab.dart';

class HomeScreenViewModel extends Cubit<HomeStates>{
  HomeScreenViewModel(): super(HomeInitialState());
  //todo hold data- implement logic

  int selectedIndex =0;
  List<Widget>tabs=[
    const HomeTab(),
    const ProductListTab(),
    const FavoritesTab(),
    const ProfileTab()
  ];

  void changeTabs(int newSelectedTab){
    emit(HomeInitialState());
    selectedIndex = newSelectedTab;
    emit(HomeChangeTabsState());
  }


}