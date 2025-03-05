import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:vitamins/core/connections/network_info.dart';
import 'package:vitamins/core/databases/api/dio_consumer.dart';
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

void setup() {
  // ---------------------------
  // Network Dependencies
  // ---------------------------
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());

  // ---------------------------
  // Authentication Dependencies
  // ---------------------------
  // Data Sources
  sl.registerLazySingleton<DataSource>(() => AuthServicesImpl());

  // Repository
  sl.registerLazySingleton<AuthRepositry>(() => AuthRepositoryImpl());

  // Use Cases
  sl.registerLazySingleton<SignupUsecase>(() => SignupUsecase());
  sl.registerLazySingleton<SigninUsecase>(() => SigninUsecase());
  sl.registerLazySingleton<ForgetpasswordUsecase>(() => ForgetpasswordUsecase());
  sl.registerLazySingleton<ResetpasswordUsecase>(() => ResetpasswordUsecase());

  // ---------------------------
  // Home/Products Dependencies
  // ---------------------------
  // Cache Helper
  sl.registerLazySingleton(() => CacheHelper());

  // Data Sources
  sl.registerLazySingleton<ProductsRemoteData>(() => ProductsRemoteData(dioClient: sl()));
  sl.registerLazySingleton<ProductsLocalData>(() => ProductsLocalData(cacheHelper: sl()));

  // Register ProductRepositry interface with its implementation
  sl.registerLazySingleton<ProductRepositry>(() => ProductRepositryImpl(sl(), sl(), sl()));

  // Use Cases
  sl.registerLazySingleton<UsecaseProduct>(() => UsecaseProduct(sl()));
}
