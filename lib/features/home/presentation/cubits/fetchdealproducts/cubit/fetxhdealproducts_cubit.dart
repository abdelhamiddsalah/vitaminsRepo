import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vitamins/core/errors/failures.dart';
import 'package:vitamins/features/home/domain/entities/product_entity.dart';
import 'package:vitamins/features/home/domain/usecases/usecase_product.dart';
  // Failure class

part 'fetxhdealproducts_state.dart';

class FetxhdealproductsCubit extends Cubit<FetxhdealproductsState> {
  final UsecaseProduct getProductsUseCase;

  FetxhdealproductsCubit(this.getProductsUseCase) : super(FetxhdealproductsInitial());

  Future<void> getProducts({Map<String, dynamic>? queryParams}) async {
    emit(FetxhdealproductsLoading());  // عند البدء في تحميل البيانات
    final result = await getProductsUseCase.call(queryParams: queryParams);

    result.fold(
      (failure) => emit(FetxhdealproductsError(_mapFailureToMessage(failure))), // التعامل مع الفشل
      (products) => emit(FetxhdealproductsLoaded(products)),  // عند تحميل البيانات بنجاح
    );
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
