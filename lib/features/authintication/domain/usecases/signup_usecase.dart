import 'package:dartz/dartz.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/core/usecasess/usecasee.dart';
import 'package:vitamins/features/authintication/data/models/signup_user_params.dart';
import 'package:vitamins/features/authintication/domain/repositriess/auth_repositry.dart';

class SignupUsecase implements UseCase<Either,SignupUserParams>{
  @override
  Future<Either> call({SignupUserParams? param}) {
    return sl<AuthRepositry>().signup(param!);
  }
}