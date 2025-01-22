import 'package:e_commerce_app/domain/entities/home_categ_or_brand_entity.dart';
import 'package:e_commerce_app/domain/use_case/home_brand_use_case.dart';
import 'package:e_commerce_app/domain/use_case/home_categ_use_case.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/app_assets.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  HomeTabViewModel(
      {required this.homeCategUseCase, required this.homeBrandUseCase})
      : super(HomeTabInitialState());
  List<Image> adverts = [
    Image.asset(AppAssets.announcement1),
    Image.asset(AppAssets.announcement2),
    Image.asset(AppAssets.announcement3),
  ];
  HomeCategUseCase homeCategUseCase;
  HomeBrandUseCase homeBrandUseCase;
  List<CategOrBrandDataEntity> categData = [];
  List<CategOrBrandDataEntity> brandList = [];
  void getCategories() async {
    emit(HomeCategLoadingState(loadingText: 'Loading .....'));
    var either = await homeCategUseCase.invoke();
    either.fold((fail) {
      emit(HomeCategFailureState(failureEntity: fail));
    }, (response) {
      categData = response.data ?? [];
      emit(HomeCategSuccessState(homeCategEntity: response));
    });
  }

  void getBrands() async {
    emit(HomeBrandLoadingState(loadingText: 'Loading ......'));
    var either = await homeBrandUseCase.invoke();
    either.fold((left) {
      emit(HomeBrandFailState(failureEntity: left));
    }, (response) {
      brandList = response.data ?? [];
      emit(HomeBrandSuccessState(homeBrandEntity: response));
    });
  }
}
