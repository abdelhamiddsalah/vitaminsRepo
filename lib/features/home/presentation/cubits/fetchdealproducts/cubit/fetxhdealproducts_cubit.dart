import 'package:bloc/bloc.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/features/home/domain/usecases/usecase_product.dart';
import 'package:vitamins/features/home/presentation/cubits/fetchdealproducts/cubit/fetxhdealproducts_state.dart';


class FetchDealProductsCubit extends Cubit<FetchDealProductsState> {
  final UsecaseProduct usecaseProduct = sl<UsecaseProduct>();

  FetchDealProductsCubit() : super(FetchDealProductsInitial());

  fetchProducts() async {
    emit(FetchDealProductsLoading());
    final result = await usecaseProduct.call(
      queryParams: {'isDeal': true, 'category': 'Sugar Substitute'},
    );
    result.fold(
      (failure) => emit(FetchDealProductsError(failure.message)),
      (products) => emit(FetchDealProductsLoaded(products)),
    );
  }
}
