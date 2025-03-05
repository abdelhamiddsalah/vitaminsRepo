part of 'categries_cubit.dart';

@immutable
sealed class CategriesState {}

final class CategriesInitial extends CategriesState {}

final class CategriesLoading extends CategriesState {}

final class CategriesLoaded extends CategriesState {
  final List<CategoryEntity> categories;
  CategriesLoaded(this.categories);
}

final class CategriesError extends CategriesState {
  final String message;
  CategriesError(this.message);
}
