import 'package:e_commerce_app/data/model/response/ErrorsRegister.dart';
import 'package:e_commerce_app/domain/entities/AuthResultEntity.dart';

import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Ahmed","email":"minamina123@yahoo.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YmRlZDY5ZWQwZGMwMDE2YzY5ODI4ZiIsIm5hbWUiOiJBaG1lZCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzIzNzIzMTE0LCJleHAiOjE3MzE0OTkxMTR9.Lj7cvgCL-nWbwn0uS1N9FVaRvtCJ6MVW6MZN9NEYxt0"

class RegisterResponseDto {
  RegisterResponseDto({
    this.message,
    this.statusMsg,
    this.user,
    this.errors,
    this.token,
  });

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    errors = json['errors'] != null ? ErrorsRegister.fromJson(json['errors']) : null;
    token = json['token'];
  }
  String? message;
  String? statusMsg;
  UserDto? user;
  ErrorsRegister? errors;
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
  AuthResultEntity toRegisterResponseDto(){
    return AuthResultEntity(
      token: token,
      userEntity: user?.toUserEntity()
    );
  }
}
