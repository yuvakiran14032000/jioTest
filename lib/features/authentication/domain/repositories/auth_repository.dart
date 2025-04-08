import 'package:dartz/dartz.dart';
import 'package:jioyathri/core/errors/failure.dart';
import 'package:jioyathri/core/params/parameters.dart';
import 'package:jioyathri/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> registerUser(RegisterParams params);
  Future<Either<Failure, UserEntity>> loginUser(LoginParams params);
  UserEntity? getUser();
  Future<void> logoutUser();
}
