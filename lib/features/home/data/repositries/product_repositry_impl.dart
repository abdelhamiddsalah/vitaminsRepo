import 'package:dartz/dartz.dart';
import 'package:vitamins/core/connections/network_info.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/core/errors/exception.dart';
import 'package:vitamins/core/errors/failures.dart';
import 'package:vitamins/features/home/data/datasources/products_local_data.dart';
import 'package:vitamins/features/home/data/datasources/products_remote_data.dart';
import 'package:vitamins/features/home/data/models/product_model.dart';
import 'package:vitamins/features/home/domain/entities/category_entity.dart';
import 'package:vitamins/features/home/domain/entities/product_entity.dart';
import 'package:vitamins/features/home/domain/repositries/product_repositry.dart';

class ProductRepositryImpl implements ProductRepositry {
  final NetworkInfo networkInfo;
  final ProductsRemoteData  productsRemoteData = sl<ProductsRemoteData>();
  final ProductsLocalData  productsLocalData = sl<ProductsLocalData>();

  ProductRepositryImpl(this.networkInfo);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({Map<String, dynamic>? queryParams}) async {
    if (await networkInfo.isConnected) {
      try {
        final List<ProductModel> remoteProducts = await productsRemoteData.getProducts(queryParams);
        await productsLocalData.cacheproducts(remoteProducts);
        return Right(remoteProducts.map((model) => model.toEntity()).toList());
      } on ServerException catch (e) {
        return Left(Failure(message: e.errorModel.message));
      }
    } else {
      try {
        final List<ProductModel> localProducts = await productsLocalData.getLastProducts();
        return Right(localProducts.map((model) => model.toEntity()).toList());
      } on CacheExeption catch (e) {
        return Left(Failure(message: e.errorMessage));
      }
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategory() async{
    if (await networkInfo.isConnected) {
      try {
        final List<CategoryEntity> remoteCategory = await productsRemoteData.getCategory();
        return Right(remoteCategory);
      } on ServerException catch (e) {
        return Left(Failure(message: e.errorModel.message));
      }
    } else {
      try {
        final List<CategoryEntity> localCategory = await productsLocalData.getLastCategory();
        return Right(localCategory);
      } on CacheExeption catch (e) {
        return Left(Failure(message: e.errorMessage));
      }
    }
      
    }
  }
