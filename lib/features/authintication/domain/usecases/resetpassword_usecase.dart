import 'package:dartz/dartz.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/core/usecasess/usecasee.dart';
import 'package:vitamins/features/authintication/data/models/resetpassword_user_params.dart';
import 'package:vitamins/features/authintication/domain/repositriess/auth_repositry.dart';

class ResetpasswordUsecase implements UseCase<Either, ResetpasswordUserParams>{
  @override
  Future<Either> call({ResetpasswordUserParams? param}) {
    return sl<AuthRepositry>().resetpassword(param!);
  }

}