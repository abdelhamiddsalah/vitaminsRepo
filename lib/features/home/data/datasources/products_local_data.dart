import 'dart:convert';

import 'package:vitamins/core/databases/cache/cache_helper.dart';
import 'package:vitamins/core/errors/exception.dart';
import 'package:vitamins/features/home/data/models/category_model.dart';
import 'package:vitamins/features/home/data/models/product_model.dart';

class ProductsLocalData {
  final CacheHelper cacheHelper;

  ProductsLocalData({required this.cacheHelper});

  // Cache a list of products
  Future<void> cacheproducts(List<ProductModel> products) async {
    if (products.isNotEmpty) {
      final encodedProducts = json.encode(products.map((product) => product.toJson()).toList());
      await cacheHelper.saveData(key: 'CachedProducts', value: encodedProducts);
    } else {
      throw CacheExeption(errorMessage: 'No products to cache');
    }
  }

  // Retrieve the cached list of products
  Future<List<ProductModel>> getLastProducts() async {
    final cachedProducts = await cacheHelper.getData(key: 'CachedProducts');
    if (cachedProducts != null) {
      final List<dynamic> decodedProducts = json.decode(cachedProducts);
      return decodedProducts.map((product) => ProductModel.fromJson(product)).toList();
    } else {
      throw CacheExeption(errorMessage: 'No cached products found');
    }
  }

  // Cache a list of categories
  Future<void> cachecategories(List<CategoryModel> categories) async {
    if (categories.isNotEmpty) {
      final encodedCategories = json.encode(categories.map((category) => category.toJson()).toList());
      await cacheHelper.saveData(key: 'CachedCategories', value: encodedCategories);
    } else {
      throw CacheExeption(errorMessage: 'No categories to cache');
    }
  }

  // Retrieve the cached list of categories
  Future<List<CategoryModel>> getLastCategory() async {
    final cachedCategories = await cacheHelper.getData(key: 'CachedCategories');
    if (cachedCategories != null) {
      final List<dynamic> decodedCategories = json.decode(cachedCategories);
      return decodedCategories.map((category) => CategoryModel.fromJson(category)).toList();
    } else {
      throw CacheExeption(errorMessage: 'No cached categories found');
    }
  }
}