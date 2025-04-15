import 'package:dartz/dartz.dart';
import 'package:jioyathri/core/errors/failure.dart';

abstract class OnboardingRepositories {
  Future<Either<Failure, bool>> getOnboardingStatus();
  Future<Either<Failure, bool>> setOnboardingStatus();
}
