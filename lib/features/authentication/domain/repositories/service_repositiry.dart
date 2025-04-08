import 'package:dartz/dartz.dart';
import 'package:jioyathri/core/errors/failure.dart';
import 'package:jioyathri/features/authentication/domain/entities/service_entity.dart';

abstract class ServiceRepositiry {
  Future<Either<Failure, List<ServiceEntity>>> getServices();
}
