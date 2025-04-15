import 'package:dartz/dartz.dart';
import 'package:jioyathri/core/errors/failure.dart';
import 'package:jioyathri/features/onboarding/domain/repositories/onboarding_repositories.dart';

class GetOnboardingStatusUsecase {
  final OnboardingRepositories onboardingRepositories;
  GetOnboardingStatusUsecase(this.onboardingRepositories);

  Future<Either<Failure, bool>> execute() async {
    return await onboardingRepositories.getOnboardingStatus();
  }
}

class SetOnboardingStatusUsecase {
  final OnboardingRepositories onboardingRepositories;

  SetOnboardingStatusUsecase(this.onboardingRepositories);

  Future<Either<Failure, bool>> execute() async {
    return await onboardingRepositories.setOnboardingStatus();
  }
}
