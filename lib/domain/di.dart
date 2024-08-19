//todo viewModel => object of useCase
//todo useCase => object of reposatory
//todo reposatory => object of dataSource
//todo dataSource => object of ApiManager

import 'package:e_commerce_app/data/api/api_manager.dart';
import 'package:e_commerce_app/data/reposatory/data_source/remote_data_source_impl.dart';
import 'package:e_commerce_app/data/reposatory/reposatory/auth_repo_impl.dart';
import 'package:e_commerce_app/domain/reposatory/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/reposatory/reposatory/auth_repo.dart';
import 'package:e_commerce_app/domain/use_case/login_use_case.dart';
import 'package:e_commerce_app/domain/use_case/register_use_case.dart';

RegisterUseCase injectableUseCase(){
  return RegisterUseCase(authRepo: injectableAuthRepo());
}
AuthRepo injectableAuthRepo(){
  return AuthRepoImpl(authRemoteDataSource: injectableAuthDataSource());
}
AuthRemoteDataSource injectableAuthDataSource(){
  return RemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}


LoginUseCase injectableLoginUseCase(){
  return LoginUseCase(authRepo: injectableAuthRepo());
}
AuthRepo injectableLoginAuthRepo(){
  return AuthRepoImpl(authRemoteDataSource: injectableAuthDataSource());
}
AuthRemoteDataSource injectableLoginAuthDataSource(){
  return RemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}