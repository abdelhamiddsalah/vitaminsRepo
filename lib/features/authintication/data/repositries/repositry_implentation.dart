import 'package:dartz/dartz.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/features/authintication/data/datasources/data_source.dart';
import 'package:vitamins/features/authintication/data/models/signup_user_params.dart';
import 'package:vitamins/features/authintication/domain/repositriess/auth_repositry.dart';

class AuthRepositoryImpl implements AuthRepositry {


  @override
  Future<Either> signup(SignupUserParams signupUserParams) async {
   return sl<DataSource>().signup(signupUserParams);
  }
  
  @override
  Future<Either> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
