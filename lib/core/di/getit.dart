import 'package:get_it/get_it.dart';
import 'package:vitamins/core/databases/api/dio_consumer.dart';
import 'package:vitamins/features/authintication/data/datasources/data_source.dart';
import 'package:vitamins/features/authintication/data/repositries/repositry_implentation.dart';
import 'package:vitamins/features/authintication/domain/repositriess/auth_repositry.dart';
import 'package:vitamins/features/authintication/domain/usecases/forgetpassword_usecase.dart';
import 'package:vitamins/features/authintication/domain/usecases/resetpassword_usecase.dart';
import 'package:vitamins/features/authintication/domain/usecases/signin_usecase.dart';
import 'package:vitamins/features/authintication/domain/usecases/signup_usecase.dart';
import 'package:vitamins/features/home/data/repositries/product_repositry_impl.dart';
import 'package:vitamins/features/home/domain/repositries/product_repositry.dart';
import 'package:vitamins/features/home/domain/usecases/usecase_product.dart';
import 'package:vitamins/features/home/presentation/cubits/fetchcategories/cubit/fetchcategories_cubit.dart';

final sl = GetIt.instance;

void setup() {
  // تسجيل DioClient
  sl.registerLazySingleton<DioClient>(() => DioClient());

  // تسجيل DataSource و Repository الخاص بالتسجيل والدخول
  sl.registerLazySingleton<DataSource>(() => AuthServicesImpl());
  sl.registerLazySingleton<AuthRepositry>(() => AuthRepositoryImpl());

  // تسجيل الـ UseCases الخاصة بالتسجيل والدخول
  sl.registerLazySingleton<SignupUsecase>(() => SignupUsecase());
  sl.registerLazySingleton<SigninUsecase>(() => SigninUsecase());
  sl.registerLazySingleton<ForgetpasswordUsecase>(() => ForgetpasswordUsecase());
  sl.registerLazySingleton<ResetpasswordUsecase>(() => ResetpasswordUsecase());

  // تسجيل الـ Repository الخاص بالمنتجات
  sl.registerLazySingleton<ProductRepositry>(
      () => ProductRepositryImpl(dioClient: sl()));

  // تسجيل الـ UseCase الخاص بالمنتجات
  sl.registerLazySingleton<UsecaseProduct>(() => UsecaseProduct(sl()));

  // تسجيل Cubit الخاص بجلب المنتجات
  sl.registerFactory<FetchcategoriesCubit>(() => FetchcategoriesCubit(sl()));
}
