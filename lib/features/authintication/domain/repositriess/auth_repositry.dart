import 'package:dartz/dartz.dart';
import 'package:vitamins/features/authintication/data/models/forgetpassword_user_params.dart';
import 'package:vitamins/features/authintication/data/models/resetpassword_user_params.dart';
import 'package:vitamins/features/authintication/data/models/signin_user_params.dart';
import 'package:vitamins/features/authintication/data/models/signup_user_params.dart';

abstract class AuthRepositry {
  Future<Either> login(SigninUserParams signinUserParams);
  Future<Either> signup(SignupUserParams signupUserParams);
  Future<Either> forgetpassord (ForgetpasswordUserParams forgetpasswordUserParams);
  Future<Either> resetpassword (ResetpasswordUserParams resetpasswordUserParams);
}