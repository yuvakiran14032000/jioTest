import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:jioyathri/core/errors/failure.dart';
import 'package:jioyathri/features/onboarding/domain/usecases/onboarding_usecase.dart';

class OnboardingProvider with ChangeNotifier {
  final GetOnboardingStatusUsecase getOnboardingStatusUsecase;
  final SetOnboardingStatusUsecase setOnboardingStatusUsecase;

  OnboardingProvider(
    this.getOnboardingStatusUsecase,
    this.setOnboardingStatusUsecase,
  ) {
    getOnboardingStatus();
  }

  Failure? _error;
  bool _onboardingstatus = false;
  bool _isLoading = false;

  Failure? get error => _error;
  bool get onboardingstatus => _onboardingstatus;
  bool get isLoading => _isLoading;

  Future<void> getOnboardingStatus() async {
    _error = null;
    _isLoading = true;
    notifyListeners();
    final response = await getOnboardingStatusUsecase.execute();
    response.fold(
      (left) {
        _error = left;
      },
      (right) {
        _onboardingstatus = right;
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> setOnboardingStatus() async {
    _error = null;
    notifyListeners();
    final response = await setOnboardingStatusUsecase.execute();
    response.fold((left) {
      _error = left;
    }, (right) {});

    notifyListeners();
  }
}
