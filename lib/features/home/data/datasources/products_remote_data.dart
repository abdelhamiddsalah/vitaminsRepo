import 'package:vitamins/core/databases/api/dio_consumer.dart';
import 'package:vitamins/core/databases/api/endpoints.dart';
import 'package:vitamins/features/home/data/models/category_model.dart';
import 'package:vitamins/features/home/data/models/product_model.dart';

class ProductsRemoteData {
  final DioClient dioClient;

  ProductsRemoteData({required this.dioClient});

  Future<List<ProductModel>> getProducts(Map<String, dynamic>? queryParams) async {
    final response = await dioClient.get(
      Endpoints.fetchisdealproductsendpoint,
      queryParameters: queryParams ?? {},
    );

    if (response is List) {
      return response.map((product) => ProductModel.fromJson(product)).toList();
    } else {
      throw Exception('Expected a list of products but got ${response.runtimeType}');
    }
  }

  Future<List<CategoryModel>> getCategory() async {
    final response = await dioClient.get(Endpoints.fetchcategoriesendpoint);

    if (response is List) {
      return response.map((category) => CategoryModel.fromJson(category)).toList();
    } else {
      throw Exception('Expected a list of categories but got ${response.runtimeType}');
    }
  }
}