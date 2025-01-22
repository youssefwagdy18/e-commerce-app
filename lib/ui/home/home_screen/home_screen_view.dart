import 'package:e_commerce_app/ui/home/home_screen/cubit/home_screen_view_model.dart';
import 'package:e_commerce_app/ui/home/home_screen/cubit/home_states.dart';
import 'package:e_commerce_app/ui/home/home_screen/widget/customized_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  static const String routeName = 'home_screen_view';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: customizedBottomNavigationBar(
              selectedIndex: viewModel.selectedIndex,
              onTapFunction: (index) {
                viewModel.changeTabs(index);
              },
              context: context),
          body: viewModel.tabs[viewModel.selectedIndex],
        );
      },
    );
  }
}
