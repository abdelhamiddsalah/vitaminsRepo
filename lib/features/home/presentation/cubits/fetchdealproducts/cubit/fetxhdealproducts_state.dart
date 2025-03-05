import 'package:flutter/foundation.dart';
import 'package:vitamins/features/home/domain/entities/product_entity.dart';

@immutable
sealed class FetchDealProductsState {}

final class FetchDealProductsInitial extends FetchDealProductsState {}

final class FetchDealProductsLoading extends FetchDealProductsState {}

final class FetchDealProductsLoaded extends FetchDealProductsState {
  final List<ProductEntity> products;
  FetchDealProductsLoaded(this.products);
}

final class FetchDealProductsError extends FetchDealProductsState {
  final String message;
  FetchDealProductsError(this.message);
}
