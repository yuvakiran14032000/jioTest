import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:jioyathri/core/errors/failure.dart';
import 'package:jioyathri/core/success/success.dart';
import 'package:jioyathri/features/authentication/data/models/user_model.dart';
import 'package:jioyathri/features/authentication/domain/entities/user_entity.dart';

class AuthLocalstorage {
  static const String _userBox = 'userBox';

  Future<void> init() async {
    await Hive.openBox<UserModel>(_userBox);
  }

  Future<Either<Failure, Success>> saveUsertoLocalStorage(
    UserModel modal,
  ) async {
    try {
      final box = Hive.box<UserModel>(_userBox);
      await box.clear();
      await box.add(modal);

      log(box.length.toString());

      return Right(ServerSuccess(successMessage: 'User Saved to localStorage'));
    } catch (e) {
      log(e.toString());
      return Left(
        ServerFailure(errorMessage: "Couldn't save user to localstorage"),
      );
    }
  }

  Future<void> clearUser() async {
    final box = Hive.box<UserModel>(_userBox);
    await box.clear();
  }

  UserEntity? getUser() {
    final box = Hive.box<UserModel>(_userBox);
    log(box.length.toString());
    return box.values.isEmpty ? null : box.values.first.toEntity();
  }
}
