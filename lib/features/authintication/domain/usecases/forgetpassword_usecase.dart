import 'package:dartz/dartz.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/core/usecasess/usecasee.dart';
import 'package:vitamins/features/authintication/data/models/forgetpassword_user_params.dart';
import 'package:vitamins/features/authintication/domain/repositriess/auth_repositry.dart';

class ForgetpasswordUsecase implements UseCase<Either,ForgetpasswordUserParams>{
  @override
  Future<Either> call({ForgetpasswordUserParams? param}) {
    return sl<AuthRepositry>().forgetpassord(param!);
  }
}