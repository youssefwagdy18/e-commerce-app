import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_constants.dart';
import 'package:e_commerce_app/data/model/request/login_request.dart';
import 'package:e_commerce_app/data/model/request/register_request.dart';
import 'package:e_commerce_app/data/model/response/add_to_cart_dto.dart';
import 'package:e_commerce_app/data/model/response/home_categ_or_brands_dto.dart';
import 'package:e_commerce_app/data/model/response/login_response_dto.dart';
import 'package:e_commerce_app/data/model/response/product_dto.dart';
import 'package:e_commerce_app/data/model/response/register_response_dto.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/ui/utils/shared_preference_utils.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<FailureEntity, RegisterResponseDto>> registerAuth(
      String name,
      String password,
      String rePassword,
      String phoneNumber,
      String email) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.registerEndPoint);
      var registerRequest = RegisterRequest(
          name: name,
          email: email,
          password: password,
          phone: phoneNumber,
          rePassword: rePassword);
      var response = await http.post(url, body: registerRequest.toJson());
      var registerResponse =
          RegisterResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(registerResponse);
      } else {
        return left(ServerAuthFailureEntity(
            errorMsg: registerResponse.errors?.msg != null
                ? registerResponse.errors!.msg!
                : registerResponse.message));
      }
    } else {
      return left(
          NetworkAuthFailureEntity(errorMsg: 'Please Check your connection'));
    }
  }

  Future<Either<FailureEntity, LoginResponseDto>> loginAuth(
      String password, String email) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.loginEndPoint);
      var loginRequest = LoginRequest(email: email, password: password);
      var response = await http.post(url, body: loginRequest.toJson());
      var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(loginResponse);
      } else {
        return left(ServerAuthFailureEntity(
            errorMsg: loginResponse.errors?.msg != null
                ? loginResponse.errors!.msg!
                : loginResponse.message));
      }
    } else {
      return left(
          NetworkAuthFailureEntity(errorMsg: 'Please Check your connection'));
    }
  }

  Future<Either<FailureEntity, HomeCategOrBrandDto>> getCategories() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.categEndPoint);
      var response = await http.get(url);
      var categResponse = HomeCategOrBrandDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(categResponse);
      } else {
        return left(ServerAuthFailureEntity(errorMsg: categResponse.statusMsg));
      }
    } else {
      return left(
          NetworkAuthFailureEntity(errorMsg: 'Please check connectivity'));
    }
  }

  Future<Either<FailureEntity,HomeCategOrBrandDto>>getBrands()async{
    var connectivity =await Connectivity().checkConnectivity();
    if(connectivity.contains(ConnectivityResult.mobile)||connectivity.contains(ConnectivityResult.wifi)){
      Uri url = Uri.https(ApiConstants.baseUrl,ApiEndPoints.brandsEndPoint);
      var response =await http.get(url);
      var brandsResponse =HomeCategOrBrandDto.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode<300){
        return right(brandsResponse);
      }else{
        return left(ServerAuthFailureEntity(errorMsg: brandsResponse.statusMsg));
      }
    }else{
      return left(NetworkAuthFailureEntity(errorMsg: 'Please check connectivity'));
    }
  }
  
  Future<Either<FailureEntity,ProductDto>>getProducts()async{
    var connectivity = await Connectivity().checkConnectivity();
    if(connectivity.contains(ConnectivityResult.mobile)||connectivity.contains(ConnectivityResult.wifi)){
      Uri url = Uri.https(ApiConstants.baseUrl,ApiEndPoints.productEndPoint);
      var response = await http.get(url);
      var productResponse = ProductDto.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode<300){
        return right(productResponse);
      }else {
        return left(ServerAuthFailureEntity(errorMsg: productResponse.statusMsg));
      }
    }else{
      return left(NetworkAuthFailureEntity(errorMsg: 'Please check connectivity')) ;
    }

  }
  Future<Either<FailureEntity,AddToCartDto>>addToCart(String productId)async{
    var connectivity = await Connectivity().checkConnectivity();
    if(connectivity.contains(ConnectivityResult.mobile)||connectivity.contains(ConnectivityResult.wifi)){
      Uri url = Uri.https(ApiConstants.baseUrl,ApiEndPoints.addToCartsEndPoint);
      var token =SharedPreferenceUtils.getData(key: 'Token');
      var response = await http.post(url,
      body: {
        'productId' :productId
      },
        headers: {
        'token': token.toString()
        }
      );
      var addToCartResponse = AddToCartDto.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200 && response.statusCode<300){
        return right(addToCartResponse);
      }else if(response.statusCode ==401){
        return left(ServerAuthFailureEntity(errorMsg: addToCartResponse.message));
      } else {
        return left(ServerAuthFailureEntity(errorMsg: addToCartResponse.statusMsg));
      }
    }else{
      return left(NetworkAuthFailureEntity(errorMsg: 'Please check connectivity')) ;
    }

  }
}
