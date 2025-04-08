import 'package:dartz/dartz.dart';
import 'package:jioyathri/core/errors/failure.dart';
import 'package:jioyathri/features/authentication/data/datasources/service_datasource.dart';
import 'package:jioyathri/features/authentication/domain/entities/service_entity.dart';
import 'package:jioyathri/features/authentication/domain/repositories/service_repositiry.dart';

class ServiceRepositoryImpl extends ServiceRepositiry {
  final ServiceDatasource serviceDatasource;

  ServiceRepositoryImpl(this.serviceDatasource);
  @override
  Future<Either<Failure, List<ServiceEntity>>> getServices() async {
    return await serviceDatasource.getServices();
  }
}
