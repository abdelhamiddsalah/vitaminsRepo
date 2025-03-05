import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/features/home/domain/entities/category_entity.dart';
import 'package:vitamins/features/home/domain/usecases/usecase_product.dart';

part 'categries_state.dart';

class CategriesCubit extends Cubit<CategriesState> {
  final UsecaseProduct usecaseProduct = sl<UsecaseProduct>();
  CategriesCubit() : super(CategriesInitial());

  fetchCategories() async {
    emit(CategriesLoading());
    final result = await usecaseProduct.getCategory();
    result.fold(
      (failure) => emit(CategriesError(failure.message)),
      (categories) => emit(CategriesLoaded(categories)),
    );
  }
}
