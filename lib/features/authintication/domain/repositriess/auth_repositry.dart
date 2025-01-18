import 'package:dartz/dartz.dart';
import 'package:vitamins/features/authintication/data/models/signin_user_params.dart';
import 'package:vitamins/features/authintication/data/models/signup_user_params.dart';

abstract class AuthRepositry {
  Future<Either> login(SigninUserParams signinUserParams);
  Future<Either> signup(SignupUserParams signupUserParams);
 // Future<void> forgetpassord (String email);
 // Future<void> resetpassword (String email, String password, String password2);
}