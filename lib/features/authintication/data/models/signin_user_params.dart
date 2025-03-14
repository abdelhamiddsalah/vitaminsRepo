import 'package:vitamins/features/authintication/domain/entities/signin_entity.dart';

class SigninUserParams extends SigninEntity{
  SigninUserParams({required super.email, required super.password});

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}