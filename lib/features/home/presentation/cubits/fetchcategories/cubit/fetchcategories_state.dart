part of 'fetchcategories_cubit.dart';

@immutable
sealed class FetchcategoriesState {}

final class FetchcategoriesInitial extends FetchcategoriesState {}

final class FetchcategoriesLoading extends FetchcategoriesState {}

final class FetchcategoriesLoaded extends FetchcategoriesState {
  final List<ProductEntity> products;
  final List<CategoryEntity> categories;
  FetchcategoriesLoaded(this.categories, this.products);
}

final class FetchcategoriesError extends FetchcategoriesState {
  final String message;
  FetchcategoriesError(this.message);
}
