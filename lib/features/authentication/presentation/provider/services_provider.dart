import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jioyathri/core/errors/failure.dart';
import 'package:jioyathri/features/authentication/domain/entities/service_entity.dart';
import 'package:jioyathri/features/authentication/domain/usecases/service_usecases.dart';

class ServicesProvider with ChangeNotifier {
  final GetServicesUsecase getServicesUsecase;
  ServicesProvider(this.getServicesUsecase) {
    getServices();
  }

  List<ServiceEntity> _services = [];
  List<ServiceEntity> get services => _services;
  Failure? _error;
  Failure? get error => _error;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getServices() async {
    _error = null;
    _isLoading = false;
    final response = await getServicesUsecase.execute();
    response.fold(
      (left) {
        _services = [];
        _error = left;
        log(left.errorMessage);
      },
      (right) {
        _services = right;
        log(_services.toString());
      },
    );
    _isLoading = false;
    notifyListeners();
  }
}
