import 'package:vitamins/core/databases/api/dio_consumer.dart';
import 'package:vitamins/core/databases/api/endpoints.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/features/home/data/models/category_model.dart';
import 'package:vitamins/features/home/data/models/product_model.dart';

class ProductsRemoteData {
  final DioConsumer dioClient= sl<DioConsumer>();

  ProductsRemoteData();

  Future<List<ProductModel>> getProducts(Map<String, dynamic>? queryParams) async {
    final response = await dioClient.get(
      path:  Endpoints.fetchisdealproductsendpoint,
      queryParameters: queryParams ?? {},
    );

    return response.fold(
      (failure) => throw Exception('Failed to fetch products: $failure'),
      (data) {
        if (data.data is List) {
          return (data.data as List).map((product) => ProductModel.fromJson(product)).toList();
        } else {
          throw Exception('Expected a list of products but got ${data.runtimeType}');
        }
      },
    );
  }

  Future<List<CategoryModel>> getCategory() async {
    final response = await dioClient.get(path :Endpoints.fetchcategoriesendpoint);

    return response.fold(
      (failure) => throw Exception('Failed to fetch categories: $failure'),
      (data) {
        if (data.data is List) {
          return (data.data as List).map((category) => CategoryModel.fromJson(category)).toList();
        } else {
          throw Exception('Expected a list of categories but got ${data.runtimeType}');
        }
      },
    );
  }
}