import 'package:dartz/dartz.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/core/usecasess/usecasee.dart';
import 'package:vitamins/features/authintication/data/models/signin_user_params.dart';
import 'package:vitamins/features/authintication/domain/repositriess/auth_repositry.dart';

class SigninUsecase implements UseCase<Either,SigninUserParams>{
  @override
  Future<Either> call({SigninUserParams? param}) {
    return sl<AuthRepositry>().login(param!);
  }
}