part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  final List<ProductModel> productsList;
  const ProductsLoaded({required this.productsList});
}

final class ProductsError extends ProductsState {
  final String message;
  const ProductsError({required this.message});
}
final class ProductsFavouriteLoaded extends ProductsState {
  final List<ProductModel> favouriteProductsList;
  const ProductsFavouriteLoaded({required this.favouriteProductsList});
}
final class ProductsFavouriteError extends ProductsState {
  final String message;
  const ProductsFavouriteError({required this.message});
}
final class ProductsFavouriteLoading extends ProductsState {}