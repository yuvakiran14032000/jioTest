import 'package:dartz/dartz.dart';
import 'package:jioyathri/core/errors/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingLocalstorage {
  Future<Either<Failure, bool>> getOnboardingStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final response = prefs.getBool('onboardingStatus') ?? false;

      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, bool>> setOnboardingStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final response = await prefs.setBool('onboardingStatus', true);

      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
