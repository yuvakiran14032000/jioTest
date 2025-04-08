import 'package:dartz/dartz.dart';
import 'package:jioyathri/core/errors/failure.dart';
import 'package:jioyathri/core/params/parameters.dart';
import 'package:jioyathri/features/authentication/domain/entities/user_entity.dart';
import 'package:jioyathri/features/authentication/domain/repositories/auth_repository.dart';

class RegisterUserUsecase {
  final AuthRepository authRepository;
  RegisterUserUsecase(this.authRepository);

  Future<Either<Failure, UserEntity>> execute(RegisterParams params) async {
    return await authRepository.registerUser(params);
  }
}

class LoginUserUsecase {
  final AuthRepository authRepository;

  LoginUserUsecase(this.authRepository);

  Future<Either<Failure, UserEntity>> execute(LoginParams params) async {
    return await authRepository.loginUser(params);
  }
}

class GetUserUsecase {
  final AuthRepository authRepository;

  GetUserUsecase(this.authRepository);

  UserEntity? execute() {
    return authRepository.getUser();
  }
}

class LogoutUserUsecase {
  final AuthRepository authRepository;

  LogoutUserUsecase(this.authRepository);

  Future<void> execute() async {
    return await authRepository.logoutUser();
  }
}
