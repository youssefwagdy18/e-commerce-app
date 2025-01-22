import 'package:e_commerce_app/domain/entities/user_entity.dart';

class AuthResultEntity{
  UserEntity? userEntity;
  String? token;

  AuthResultEntity({this.userEntity,this.token});
}