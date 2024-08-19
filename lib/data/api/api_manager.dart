import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/api_constants.dart';
import 'package:e_commerce_app/data/model/request/LoginRequest.dart';
import 'package:e_commerce_app/data/model/request/RegisterRequest.dart';
import 'package:e_commerce_app/data/model/response/LoginResponseDto.dart';
import 'package:e_commerce_app/data/model/response/RegisterResponseDto.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
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
      print(connectivityResult);
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
      var loginRequest = LoginRequest(
        email: email,
        password: password
      );
      var response = await http.post(url, body: loginRequest.toJson());
      var loginResponse =
          LoginResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(loginResponse);
      } else {
        return left(ServerAuthFailureEntity(
            errorMsg: loginResponse.errors?.msg != null
                ? loginResponse.errors!.msg!
                : loginResponse.message));
      }
    } else {
      print(connectivityResult);
      return left(
          NetworkAuthFailureEntity(errorMsg: 'Please Check your connection'));
    }
  }
}
