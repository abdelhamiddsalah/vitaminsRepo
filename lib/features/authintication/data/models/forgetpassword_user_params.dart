import 'package:vitamins/features/authintication/domain/entities/forgetpassword_entity.dart';

class ForgetpasswordUserParams extends ForgetpasswordEntity{
  ForgetpasswordUserParams({required super.email});

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
    };
  }
}