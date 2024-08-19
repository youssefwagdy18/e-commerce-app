import 'package:e_commerce_app/domain/entities/UserEntity.dart';
/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmed@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZDU5OGVmNDE4ODE5NzAyZjkxNmFhMCIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzIzOTgxMTcwLCJleHAiOjE3MzE3NTcxNzB9.Gn3Hx1k46pV1M-61pL6orwKbbPvRhC0neJNhNguap28"

class LoginEntity {
  LoginEntity({
      this.message, 
      this.user, 
      this.token,});

  String? message;
  UserEntity? user;
  String? token;


}