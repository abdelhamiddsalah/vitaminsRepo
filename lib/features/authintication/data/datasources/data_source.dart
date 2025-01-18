

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vitamins/core/databases/api/dio_consumer.dart';
import 'package:vitamins/core/databases/api/endpoints.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/features/authintication/data/models/signup_user_params.dart';

abstract class DataSource {
  Future<Either> signup(SignupUserParams signupUserParams);
}

class AuthServicesImpl extends DataSource {
  @override
  Future<Either> signup(SignupUserParams signupUserParams) async{
   try {
   var response =await  sl<DioClient>().post(Endpoints.registerendpoint, data: signupUserParams.toMap());
     return Right(response);
   }on DioException catch(e){
     return Left(e.response!.data['message'].toString());
   }
  }
 
}
