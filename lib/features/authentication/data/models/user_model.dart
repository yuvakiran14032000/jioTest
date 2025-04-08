import 'package:hive/hive.dart';
import 'package:jioyathri/features/authentication/domain/entities/user_entity.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends UserEntity {
  @override
  @HiveField(0)
  final String id;

  @override
  @HiveField(1)
  final String fullname;

  @override
  @HiveField(2)
  final String phone;

  @override
  @HiveField(3)
  final String email;

  @override
  @HiveField(4)
  final String password;

  @override
  @HiveField(5)
  final String profile;

  @override
  @HiveField(6)
  final String usertype;

  UserModel({
    required this.id,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.password,
    required this.profile,
    required this.usertype,
  }) : super(
         id: id,
         fullname: fullname,
         phone: phone,
         email: email,
         password: password,
         profile: profile,
         usertype: usertype,
       );

  factory UserModel.fromJson(Map<String, dynamic> Json) {
    return UserModel(
      id: Json['id'],
      fullname: Json['full_name'],
      phone: Json['phone'],
      email: Json['email'],
      password: Json['password'],
      profile: Json['profile'],
      usertype: Json['user_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullname,
      'phone': phone,
      'email': email,
      'password': password,
      'profile': profile,
      'user_type': usertype,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      fullname: fullname,
      phone: phone,
      email: email,
      password: password,
      profile: profile,
      usertype: usertype,
    );
  }
}
