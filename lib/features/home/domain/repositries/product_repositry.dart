import 'package:dartz/dartz.dart';
import 'package:vitamins/core/errors/failures.dart';
import 'package:vitamins/features/home/domain/entities/category_entity.dart';
import 'package:vitamins/features/home/domain/entities/product_entity.dart';

abstract class ProductRepositry {
  Future<Either<Failure, List<ProductEntity>>> getProducts({Map<String, dynamic>? queryParams});
  Future<Either<Failure, List<CategoryEntity>>> getCategory();
}
