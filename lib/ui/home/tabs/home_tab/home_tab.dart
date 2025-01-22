import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/widgets/customized_grid_view.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/widgets/customized_row_bar.dart';
import 'package:e_commerce_app/ui/utils/app_colors.dart';
import 'package:e_commerce_app/ui/utils/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'Home tab';
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = HomeTabViewModel(
      homeCategUseCase: injectableCategUseCase(),
      homeBrandUseCase: injectableBrandUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
        bloc: viewModel
          ..getCategories()
          ..getBrands(),
        builder: (context, states) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomSearchBar(onTextFieldTab: () {
                      // todo searching in home tab
                    }, onAddToCartTab: () {
                      //todo add to cart in home tab
                    }),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, left: 16, right: 16),
                      child: ImageSlideshow(
                        autoPlayInterval: 3000,
                        indicatorColor: AppColors.primaryColor,
                        indicatorBackgroundColor: AppColors.whiteColor,
                        indicatorRadius: 5.sp,
                        width: 400.w,
                        height: 200.h,
                        initialPage: 0,
                        isLoop: true,
                        children: viewModel.adverts,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 24.h, left: 16.w, right: 17.w, bottom: 16.h),
                        child: const CustomizedRowBar(
                          name: 'Categories',
                        ),),
                    states is HomeCategLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : CustomizedGridView(
                            data: viewModel.categData,
                          ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 24.h, left: 16.w, right: 17.w, bottom: 16.h),
                        child: const CustomizedRowBar(name: 'Brands')),
                    states is HomeBrandLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : CustomizedGridView(data: viewModel.brandList)
                    // const CustomizedGridView(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
