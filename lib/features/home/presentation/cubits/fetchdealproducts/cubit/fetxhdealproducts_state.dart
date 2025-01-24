part of 'fetxhdealproducts_cubit.dart';

@immutable
sealed class FetxhdealproductsState {}

final class FetxhdealproductsInitial extends FetxhdealproductsState {}

final class FetxhdealproductsLoading extends FetxhdealproductsState {}

final class FetxhdealproductsLoaded extends FetxhdealproductsState {
  final List<ProductEntity> products;
  FetxhdealproductsLoaded(this.products);
}

final class FetxhdealproductsError extends FetxhdealproductsState {
  final String message;
  FetxhdealproductsError(this.message);
}
