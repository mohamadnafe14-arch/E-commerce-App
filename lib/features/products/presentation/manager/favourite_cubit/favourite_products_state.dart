part of 'favourite_products_cubit.dart';

sealed class FavouriteProductsState extends Equatable {
  const FavouriteProductsState();

  @override
  List<Object> get props => [];
}

final class FavouriteProductsInitial extends FavouriteProductsState {}

final class FavouriteProductsLoading extends FavouriteProductsState {
  @override
  List<Object> get props => [];
}

final class FavouriteProductsLoaded extends FavouriteProductsState {
  final List<ProductModel> productsList;
  const FavouriteProductsLoaded({required this.productsList});
  @override
  List<Object> get props => [productsList];
}

final class FavouriteProductsError extends FavouriteProductsState {
  final String message;
  const FavouriteProductsError({required this.message});
  @override
  List<Object> get props => [message];
}
