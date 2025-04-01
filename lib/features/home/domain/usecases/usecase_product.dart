import 'package:dartz/dartz.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/core/errors/failures.dart';
import 'package:vitamins/features/home/domain/entities/category_entity.dart';
import 'package:vitamins/features/home/domain/entities/product_entity.dart';
import 'package:vitamins/features/home/domain/repositries/product_repositry.dart';
  // Failure class needs to be defined.

class UsecaseProduct {
  final  productRepositry = sl<ProductRepositry>();

  Future<Either<Failure, List<ProductEntity>>> call({Map<String, dynamic>? queryParams}) async {
    return await productRepositry.getProducts(queryParams: queryParams);
  }

  Future<Either<Failure, List<CategoryEntity>>> getCategory() async {
    return await productRepositry.getCategory();
  }
}
