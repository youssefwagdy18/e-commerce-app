import 'UserEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed","email":"ahmedmutiahmed123@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YmI2OTFjZWQwZGMwMDE2YzUwZWMzMiIsIm5hbWUiOiJBaG1lZCIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzIzNTU4MTcyLCJleHAiOjE3MzEzMzQxNzJ9.i7XUHU-4gIO5IdGmpZow_3x3tbvyMB_Z78LuIFpiBqQ"

class RegisterEntity {
  RegisterEntity({
      this.message, 
      this.user, 
      this.token,});


  String? message;
  UserEntity? user;
  String? token;

}