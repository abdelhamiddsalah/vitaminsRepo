import 'package:vitamins/features/authintication/domain/entities/user_entity.dart';

class UserModel extends User{
  UserModel({required super.name, required super.email, required super.role, required super.password});

   factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      role: json['role'], password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'password': password
    };
  }
}