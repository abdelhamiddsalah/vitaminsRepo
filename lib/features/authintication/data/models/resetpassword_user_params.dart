import 'package:vitamins/features/authintication/domain/entities/resetpassword_entity.dart';

class ResetpasswordUserParams extends ResetpasswordEntity{
  ResetpasswordUserParams({required super.password});

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
    };
  }
}

