part of 'best_seller_cubit.dart';

sealed class BestSellerCubitState extends Equatable {
  const BestSellerCubitState();

  @override
  List<Object> get props => [];
}

final class BestSellerCubitInitial extends BestSellerCubitState {}
final class BestSellerCubitLoading extends BestSellerCubitState {}
final class BestSellerCubitLoaded extends BestSellerCubitState {
  final List<ProductModel> products;
  const BestSellerCubitLoaded({required this.products});
}
final class BestSellerCubitError extends BestSellerCubitState {
  final String message;
  const BestSellerCubitError({required this.message});
}