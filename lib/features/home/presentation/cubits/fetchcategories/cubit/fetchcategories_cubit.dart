import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitamins/core/errors/failures.dart';
import 'package:vitamins/features/home/domain/entities/category_entity.dart';
import 'package:vitamins/features/home/domain/entities/product_entity.dart';
import 'package:vitamins/features/home/domain/usecases/usecase_product.dart';

part 'fetchcategories_state.dart';

class FetchcategoriesCubit extends Cubit<FetchcategoriesState> {
  final UsecaseProduct getProductsUseCase;

  FetchcategoriesCubit(this.getProductsUseCase) : super(FetchcategoriesInitial());

  Future<void> getcategories() async {
    emit(FetchcategoriesLoading());

    try {
      final prefs = await SharedPreferences.getInstance();

      final cachedCategories = prefs.getString('cachedCategories');
      final cachedProducts = prefs.getString('cachedProducts');

      if (cachedCategories != null && cachedProducts != null) {
        // إذا كانت البيانات موجودة في الكاش
        final categories = (json.decode(cachedCategories) as List)
            .map((e) => CategoryEntity.fromJson(e))
            .toList();
        final products = (json.decode(cachedProducts) as List)
            .map((e) => ProductEntity.fromJson(e))
            .toList();

        emit(FetchcategoriesLoaded(categories, products));
      } else {
        // إذا لم تكن البيانات في الكاش، نطلبها من الـ API
        final resultCategories = await getProductsUseCase.callCategories();
        final resultProducts = await getProductsUseCase.call();

        resultCategories.fold(
          (failure) => emit(FetchcategoriesError(_mapFailureToMessage(failure))),
          (categories) async {
            resultProducts.fold(
              (failure) => emit(FetchcategoriesError(_mapFailureToMessage(failure))),
              (products) async {
                // تخزين البيانات في الكاش
                prefs.setString('cachedCategories', json.encode(categories.map((e) => e.toJson()).toList()));
                prefs.setString('cachedProducts', json.encode(products.map((e) => e.toJson()).toList()));

                emit(FetchcategoriesLoaded(categories, products));
              },
            );
          },
        );
      }
    } catch (e) {
      emit(FetchcategoriesError(e.toString()));
    }
  }

  // تحويل الفشل إلى رسالة يمكن عرضها
  String _mapFailureToMessage(Failures failure) {
    if (failure is ServerFailure) {
      return 'فشل في الاتصال بالخادم';
    } else {
      return 'حدث خطأ غير متوقع';
    }
  }
}
