import 'package:dartz/dartz.dart';
import 'package:jioyathri/core/errors/failure.dart';
import 'package:jioyathri/features/authentication/domain/entities/service_entity.dart';
import 'package:jioyathri/features/authentication/domain/repositories/service_repositiry.dart';

class GetServicesUsecase {
  final ServiceRepositiry serviceRepositiry;

  GetServicesUsecase(this.serviceRepositiry);

  Future<Either<Failure, List<ServiceEntity>>> execute() async {
    return await serviceRepositiry.getServices();
  }
}
