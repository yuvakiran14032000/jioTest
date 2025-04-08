import 'package:flutter/material.dart';
import 'package:jioyathri/core/errors/failure.dart';
import 'package:jioyathri/core/params/parameters.dart';
import 'package:jioyathri/features/authentication/domain/entities/user_entity.dart';
import 'package:jioyathri/features/authentication/domain/usecases/auth_usecases.dart';

class AuthProvider with ChangeNotifier {
  final RegisterUserUsecase registerUserUsecase;
  final LoginUserUsecase loginUserUsecase;
  final GetUserUsecase getUserUsecase;

  Failure? _error;
  UserEntity? _user;
  bool _isLoading = false;

  AuthProvider(
    this.registerUserUsecase,
    this.loginUserUsecase,
    this.getUserUsecase,
  ) {
    getUser();
  }

  Failure? get error => _error;
  UserEntity? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> registerUser(RegisterParams params) async {
    _error = null;
    _user = null;
    _isLoading = true;
    notifyListeners();

    final response = await registerUserUsecase.execute(params);

    response.fold(
      (left) {
        _error = left;
      },
      (right) {
        _user = right;
      },
    );
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loginUser(LoginParams params) async {
    _user = null;
    _error = null;
    _isLoading = true;
    notifyListeners();

    final response = await loginUserUsecase.execute(params);

    response.fold(
      (left) {
        _error = left;
      },
      (right) {
        _user = right;
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  void getUser() {
    _user = null;
    _isLoading = true;
    notifyListeners();
    final response = getUserUsecase.execute();
    _user = response;
    _isLoading = false;
    notifyListeners();
  }
}
