import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/core/shared/shared_preferences.dart';
import 'package:vitamins/features/authintication/data/datasources/data_source.dart';
import 'package:vitamins/features/authintication/data/models/forgetpassword_user_params.dart';
import 'package:vitamins/features/authintication/data/models/resetpassword_user_params.dart';
import 'package:vitamins/features/authintication/data/models/signin_user_params.dart';
import 'package:vitamins/features/authintication/data/models/signup_user_params.dart';
import 'package:vitamins/features/authintication/domain/repositriess/auth_repositry.dart';

class AuthRepositoryImpl implements AuthRepositry {

 final DataSource dataSource;
 AuthRepositoryImpl(this.dataSource);
  @override
  Future<Either> signup(SignupUserParams signupUserParams) async {
   return dataSource.signup(signupUserParams);
   
  }
  
  @override
  Future<Either> login(SigninUserParams signinUserParams) async {
    Either result = await sl<DataSource>().login(signinUserParams);
    return result.fold(
    (error) {
      // Ensure error is wrapped in Left
      return Left<String, dynamic>(error);
    }, (data) async {
      Response response = data;
     Prefs.setString('token', response.data['token']);
      return Right(response);
    });
  }
  
  @override
  Future<Either> forgetpassord(ForgetpasswordUserParams forgetpasswordUserParams) async{
    Either result = await  sl<DataSource>().forgetpassord(forgetpasswordUserParams);
    return result.fold(
    (error) {
      // Ensure error is wrapped in Left
      return Left<String, dynamic>(error);
    }, (data) async {
      Response response = data;
      return Right(response);
    });
  }
  
  @override
  Future<Either> resetpassword(ResetpasswordUserParams resetpasswordUserParams) async{
    Either result = await  sl<DataSource>().resetpassword(resetpasswordUserParams);
    return result.fold(
    (error) {
      // Ensure error is wrapped in Left
      return Left<String, dynamic>(error);
    }, (data) async {
      Response response = data;
      return Right(response);
    });
  }
}
