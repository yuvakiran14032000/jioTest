import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceEntity {
  final String id;
  final String name;
  final String category;
  final String description;
  final int baseprice;
  final String image;
  final int duration;
  final bool isActive;
  final Timestamp createdAt;

  ServiceEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.baseprice,
    required this.image,
    required this.duration,
    required this.isActive,
    required this.createdAt,
  });
}
