part of 'all_products_cubit.dart';

sealed class AllProductsState extends Equatable {
  const AllProductsState();

  @override
  List<Object> get props => [];
}

final class AllProductsInitial extends AllProductsState {}
final class AllProductsLoading extends AllProductsState {}
final class AllProductsLoaded extends AllProductsState {
  final List<ProductModel> productsList;
  const AllProductsLoaded({required this.productsList});
}
final class AllProductsError extends AllProductsState {
  final String message;
  const AllProductsError({required this.message});
}