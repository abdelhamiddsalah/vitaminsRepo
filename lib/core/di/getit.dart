import 'package:get_it/get_it.dart';
import 'package:vitamins/core/databases/api/dio_consumer.dart';
import 'package:vitamins/features/authintication/data/datasources/data_source.dart';
import 'package:vitamins/features/authintication/data/repositries/repositry_implentation.dart';
import 'package:vitamins/features/authintication/domain/repositriess/auth_repositry.dart';
import 'package:vitamins/features/authintication/domain/usecases/forgetpassword_usecase.dart';
import 'package:vitamins/features/authintication/domain/usecases/signin_usecase.dart';
import 'package:vitamins/features/authintication/domain/usecases/signup_usecase.dart';


final sl = GetIt.instance;

void setup() {
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerSingleton<DataSource>(AuthServicesImpl());
  sl.registerSingleton<AuthRepositry>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<ForgetpasswordUsecase>(ForgetpasswordUsecase());
}
