import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:jioyathri/core/constants/constants.dart';
import 'package:jioyathri/core/errors/failure.dart';
import 'package:jioyathri/core/params/parameters.dart';
import 'package:jioyathri/features/authentication/data/datasources/auth_localstorage.dart';
import 'package:jioyathri/features/authentication/data/models/user_model.dart';
import 'package:jioyathri/features/authentication/domain/entities/user_entity.dart';
import 'package:uuid/uuid.dart';

class AuthDatasource {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final authLocalStorage = AuthLocalstorage();

  static const int _minLetterCount = 6;

  bool _hasEnoughLetters(String password) {
    final letterCount = password.trim().length;
    return letterCount >= _minLetterCount;
  }

  String _hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = md5.convert(bytes);
    return digest.toString();
  }

  Future<Either<Failure, UserEntity>> registerUser(
    RegisterParams params,
  ) async {
    try {
      final checkUser =
          await _fireStore
              .collection('users')
              .where(
                Filter.or(
                  Filter('email', isEqualTo: params.email),
                  Filter('phone', isEqualTo: params.phone),
                ),
              )
              .where('user_type', isEqualTo: userType)
              .get();

      if (checkUser.docs.isNotEmpty) {
        return Left(ServerFailure(errorMessage: 'User already exsits'));
      }

      if (!_hasEnoughLetters(params.password)) {
        return Left(
          ServerFailure(
            errorMessage:
                'Password must contain atleast $_minLetterCount lettrrs',
          ),
        );
      }

      final uuid = Uuid().v4();

      final usermodel = UserModel(
        id: uuid,
        fullname: params.fullname,
        phone: params.phone,
        email: params.email,
        password: _hashPassword(params.password),
        profile: '',
        usertype: userType,
      );

      await _fireStore.collection('users').doc(uuid).set(usermodel.toJson());
      await authLocalStorage.saveUsertoLocalStorage(usermodel);

      return Right(usermodel.toEntity());
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, UserEntity>> loginUser(LoginParams params) async {
    try {
      final userCheck =
          await _fireStore
              .collection('users')
              .where(
                Filter.and(
                  Filter('email', isEqualTo: params.username),
                  Filter('password', isEqualTo: _hashPassword(params.password)),
                  Filter('user_type', isEqualTo: userType),
                ),
              )
              .limit(1)
              .get();

      if (userCheck.docs.isEmpty) {
        return Left(
          ServerFailure(errorMessage: "Invalid credentials or user not found"),
        );
      }

      final userDoc = userCheck.docs.first;
      final userData = userDoc.data();

      if (userData['id'] == null ||
          userData['full_name'] == null ||
          userData['email'] == null) {
        return Left(ServerFailure(errorMessage: "User data is incomplete"));
      }

      final userModel = UserModel(
        id: userData['id'],
        fullname: userData['full_name'],
        phone: userData['phone'],
        email: userData['email'],
        password: userData['password'],
        profile: userData['profile'],
        usertype: userData['user_type'],
      );
      await authLocalStorage.saveUsertoLocalStorage(userModel);

      return Right(userModel.toEntity());
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
