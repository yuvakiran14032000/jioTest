import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:jioyathri/core/errors/failure.dart';
import 'package:jioyathri/features/authentication/data/models/service_model.dart';
import 'package:jioyathri/features/authentication/domain/entities/service_entity.dart';

class ServiceDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Either<Failure, List<ServiceEntity>>> getServices() async {
    try {
      final collection = _firestore.collection('services');
      final snapShots = await collection.get();

      final services =
          snapShots.docs.map((doc) {
            final data = doc.data();
            return ServiceModel.fromJson({"id": doc.id, ...data}).toEntity();
          }).toList();

      return Right(services);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
