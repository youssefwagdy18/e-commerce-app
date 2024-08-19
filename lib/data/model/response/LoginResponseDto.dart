import 'package:e_commerce_app/data/model/response/ErrorsRegister.dart';
import 'package:e_commerce_app/data/model/response/UserDto.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmed@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZDU5OGVmNDE4ODE5NzAyZjkxNmFhMCIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzIzOTgxMTcwLCJleHAiOjE3MzE3NTcxNzB9.Gn3Hx1k46pV1M-61pL6orwKbbPvRhC0neJNhNguap28"

class LoginResponseDto {
  LoginResponseDto({
      this.message, 
      this.user,
    this.statusMsg,
      this.token,});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    errors = json['errors'] != null ? ErrorsRegister.fromJson(json['errors']) : null;
    token = json['token'];
  }
  String? message;
  String? statusMsg;
  ErrorsRegister? errors;
  UserDto? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toLoginResponseDto(){
    return AuthResultEntity(userEntity: user?.toUserEntity(),token: token);
  }

}