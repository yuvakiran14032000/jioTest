import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:jioyathri/features/authentication/domain/entities/service_entity.dart';

part 'service_model.g.dart';

@HiveType(typeId: 1)
class ServiceModel extends ServiceEntity {
  @override
  @HiveField(1)
  final String id;

  @override
  @HiveField(2)
  final String name;

  @override
  @HiveField(3)
  final String category;

  @override
  @HiveField(4)
  final String description;

  @override
  @HiveField(5)
  final int baseprice;

  @override
  @HiveField(6)
  final String image;

  @override
  @HiveField(7)
  final int duration;

  @override
  @HiveField(8)
  final bool isActive;

  @override
  @HiveField(9)
  final Timestamp createdAt;

  ServiceModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.baseprice,
    required this.image,
    required this.duration,
    required this.isActive,
    required this.createdAt,
  }) : super(
         id: id,
         name: name,
         category: category,
         description: description,
         baseprice: baseprice,
         image: image,
         duration: duration,
         isActive: isActive,
         createdAt: createdAt,
       );

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      description: json['description'],
      baseprice: json['basePrice'],
      image: json['image'],
      duration: json['duration'],
      isActive: json['isActive'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "category": category,
      "description": description,
      'basePrice': baseprice,
      'image': image,
      'duration': duration,
      'isActive': isActive,
      'createdAt': createdAt,
    };
  }

  ServiceEntity toEntity() {
    return ServiceEntity(
      id: id,
      name: name,
      category: category,
      description: description,
      baseprice: baseprice,
      image: image,
      duration: duration,
      isActive: isActive,
      createdAt: createdAt,
    );
  }
}
