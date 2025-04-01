import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vitamins/core/connections/network_info.dart';
import 'package:vitamins/core/databases/api/dio_consumer.dart';
import 'package:vitamins/core/databases/api/interceptors.dart';
import 'package:vitamins/core/databases/cache/cache_helper.dart';
import 'package:vitamins/features/authintication/data/datasources/data_source.dart';
import 'package:vitamins/features/authintication/data/repositries/repositry_implentation.dart';
import 'package:vitamins/features/authintication/domain/repositriess/auth_repositry.dart';
import 'package:vitamins/features/authintication/domain/usecases/forgetpassword_usecase.dart';
import 'package:vitamins/features/authintication/domain/usecases/resetpassword_usecase.dart';
import 'package:vitamins/features/authintication/domain/usecases/signin_usecase.dart';
import 'package:vitamins/features/authintication/domain/usecases/signup_usecase.dart';
import 'package:vitamins/features/home/data/datasources/products_local_data.dart';
import 'package:vitamins/features/home/data/datasources/products_remote_data.dart';
import 'package:vitamins/features/home/data/repositries/product_repositry_impl.dart';
import 'package:vitamins/features/home/domain/repositries/product_repositry.dart';
import 'package:vitamins/features/home/domain/usecases/usecase_product.dart';

// تعريف GetIt لتخزين التسجيلات
final sl = GetIt.instance;

/*void setup() {
  // ---------------------------
  // Network Dependencies
  // ---------------------------
  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(()=> LoggerInterceptor());
  sl.registerLazySingleton(()=> LogInterceptor(
    request: true,
    requestBody: true,
    responseBody: true,
    requestHeader: true,
    responseHeader: true,
    error: true,
  ));

  // ---------------------------
  // Authentication Dependencies
  // ---------------------------
  // Data Sources
  sl.registerLazySingleton<DataSource>(() => AuthServicesImpl());
    sl.registerLazySingleton<ProductsRemoteData>(() => ProductsRemoteData());
  sl.registerLazySingleton<ProductsLocalData>(() => ProductsLocalData());

  // Repository
  sl.registerLazySingleton<AuthRepositry>(() => AuthRepositoryImpl( ));
  sl.registerLazySingleton<ProductRepositry>(() => ProductRepositryImpl());
  // Use Cases
  sl.registerLazySingleton<SignupUsecase>(() => SignupUsecase());
  sl.registerLazySingleton<SigninUsecase>(() => SigninUsecase());
  sl.registerLazySingleton<ForgetpasswordUsecase>(() => ForgetpasswordUsecase());
  sl.registerLazySingleton<ResetpasswordUsecase>(() => ResetpasswordUsecase());
   sl.registerLazySingleton<UsecaseProduct>(() => UsecaseProduct());
  // ---------------------------
  // Home/Products Dependencies
  // ---------------------------
  // Cache Helper
  sl.registerLazySingleton(() => CacheHelper());



  // Register ProductRepositry interface with its implementation

}*/

void setup() {
  // ---------------------------
  // Network Dependencies
  // ---------------------------

  // ✅ تسجيل LoggerInterceptor
  sl.registerLazySingleton<LoggerInterceptor>(() => LoggerInterceptor());

  // ✅ تسجيل Dio مع LoggerInterceptor
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(sl<LoggerInterceptor>()); // استخدام LoggerInterceptor بدلاً من LogInterceptor
    return dio;
  });

  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());

  // ---------------------------
  // Authentication Dependencies
  // ---------------------------
  sl.registerLazySingleton<DataSource>(() => AuthServicesImpl());
  sl.registerLazySingleton<ProductsRemoteData>(() => ProductsRemoteData());
  sl.registerLazySingleton<ProductsLocalData>(() => ProductsLocalData());

  // Repository
  sl.registerLazySingleton<AuthRepositry>(() => AuthRepositoryImpl());
  sl.registerLazySingleton<ProductRepositry>(() => ProductRepositryImpl());

  // Use Cases
  sl.registerLazySingleton<SignupUsecase>(() => SignupUsecase());
  sl.registerLazySingleton<SigninUsecase>(() => SigninUsecase());
  sl.registerLazySingleton<ForgetpasswordUsecase>(() => ForgetpasswordUsecase());
  sl.registerLazySingleton<ResetpasswordUsecase>(() => ResetpasswordUsecase());
  sl.registerLazySingleton<UsecaseProduct>(() => UsecaseProduct());

  // ---------------------------
  // Home/Products Dependencies
  // ---------------------------
  sl.registerLazySingleton(() => CacheHelper());
}
