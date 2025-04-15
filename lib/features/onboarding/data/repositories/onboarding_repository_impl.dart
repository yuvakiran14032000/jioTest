import 'package:dartz/dartz.dart';
import 'package:jioyathri/core/errors/failure.dart';
import 'package:jioyathri/features/onboarding/data/datasources/onboarding_localstorage.dart';
import 'package:jioyathri/features/onboarding/domain/repositories/onboarding_repositories.dart';

class OnboardingRepositoryImpl extends OnboardingRepositories {
  final OnboardingLocalstorage onboardingLocalstorage;

  OnboardingRepositoryImpl(this.onboardingLocalstorage);

  @override
  Future<Either<Failure, bool>> getOnboardingStatus() async {
    return await onboardingLocalstorage.getOnboardingStatus();
  }

  @override
  Future<Either<Failure, bool>> setOnboardingStatus() async {
    return await onboardingLocalstorage.setOnboardingStatus();
  }
}
