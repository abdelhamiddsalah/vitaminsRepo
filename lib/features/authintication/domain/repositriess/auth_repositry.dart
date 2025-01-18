import 'package:dartz/dartz.dart';
import 'package:vitamins/features/authintication/data/models/signup_user_params.dart';

abstract class AuthRepositry {
  Future<void> login(String email, String password);
  Future<Either> signup(SignupUserParams signupUserParams);
 // Future<void> forgetpassord (String email);
 // Future<void> resetpassword (String email, String password, String password2);
}