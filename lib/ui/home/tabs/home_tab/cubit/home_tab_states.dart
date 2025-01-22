import 'package:e_commerce_app/domain/entities/home_categ_or_brand_entity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';

abstract class HomeTabStates{}
class HomeTabInitialState extends HomeTabStates{}
class HomeCategLoadingState extends HomeTabStates{
  String? loadingText;
  HomeCategLoadingState({required this.loadingText});
}
class HomeCategSuccessState extends HomeTabStates{
  HomeCategOrBrandEntity? homeCategEntity;
  HomeCategSuccessState({required this.homeCategEntity});
}
class HomeCategFailureState extends HomeTabStates{
  FailureEntity? failureEntity;
  HomeCategFailureState({required this.failureEntity});
}

class HomeBrandLoadingState extends HomeTabStates{
  String? loadingText;
  HomeBrandLoadingState({required this.loadingText});
}

class HomeBrandSuccessState extends HomeTabStates{
  HomeCategOrBrandEntity? homeBrandEntity;
  HomeBrandSuccessState({required this.homeBrandEntity});
}

class HomeBrandFailState extends HomeTabStates{
  FailureEntity? failureEntity;
  HomeBrandFailState({required this.failureEntity});
}