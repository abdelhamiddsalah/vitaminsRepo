import 'package:vitamins/features/authintication/domain/entities/signup_entity.dart';

class SignupUserParams extends SignupEntity{
  SignupUserParams({required super.email, required super.password, required super.name, required super.role});

  Map<String, dynamic> toMap()  {
   return <String, dynamic>{
     'email': email,
     'password': password,
     'role': role,
     'name': name
   };
  }
}