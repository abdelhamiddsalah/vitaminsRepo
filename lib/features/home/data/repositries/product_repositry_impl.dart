import 'package:dartz/dartz.dart';
import 'package:vitamins/core/databases/api/dio_consumer.dart';
import 'package:vitamins/core/databases/api/endpoints.dart';
import 'package:vitamins/core/errors/failures.dart';
import 'package:vitamins/features/home/domain/entities/category_entity.dart';
import 'package:vitamins/features/home/domain/entities/product_entity.dart';
import 'package:vitamins/features/home/domain/repositries/product_repositry.dart';
// Failure class needs to be defined.

class ProductRepositryImpl implements ProductRepositry {
  final DioClient dioClient;

  ProductRepositryImpl({required this.dioClient});

  @override
  Future<Either<Failures, List<ProductEntity>>> getProducts({Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dioClient.get(Endpoints.fetchisdealproductsendpoint, queryParameters: queryParams ?? {});
      final List<ProductEntity> products = (response.data as List).map((e) => ProductEntity.fromJson(e)).toList();
      return Right(products);  // Returning Right for success
    } catch (e) {
      return Left(ServerFailure(e.toString()));  // Returning Left for failure
    }
  }

  @override
  Future<Either<Failures, List<CategoryEntity>>> getCategories() async {
    try {
      final response = await dioClient.get(Endpoints.fetchcategoriesendpoint);
      final List<CategoryEntity> categories = (response.data as List).map((e) => CategoryEntity.fromJson(e)).toList();
      return Right(categories);  // Returning Right for success
    } catch (e) {
      return Left(ServerFailure(e.toString()));  // Returning Left for failure
    }
  }
}
