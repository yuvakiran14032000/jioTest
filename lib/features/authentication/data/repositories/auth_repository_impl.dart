import 'package:dartz/dartz.dart';
import 'package:jioyathri/core/errors/failure.dart';
import 'package:jioyathri/core/params/parameters.dart';
import 'package:jioyathri/features/authentication/data/datasources/auth_datasource.dart';
import 'package:jioyathri/features/authentication/data/datasources/auth_localstorage.dart';
import 'package:jioyathri/features/authentication/domain/entities/user_entity.dart';
import 'package:jioyathri/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource authDatasource;
  final AuthLocalstorage authlocalstorage;

  AuthRepositoryImpl(this.authDatasource, this.authlocalstorage);

  @override
  UserEntity? getUser() {
    return authlocalstorage.getUser();
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser(LoginParams params) async {
    return await authDatasource.loginUser(params);
  }

  @override
  Future<void> logoutUser() async {
    return await authlocalstorage.clearUser();
  }

  @override
  Future<Either<Failure, UserEntity>> registerUser(
    RegisterParams params,
  ) async {
    return await authDatasource.registerUser(params);
  }
}
