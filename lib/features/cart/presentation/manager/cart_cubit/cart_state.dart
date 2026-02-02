part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}
final class CartLoading extends CartState {}
final class CartLoaded extends CartState {
  final CartModel cartProducts;
  const CartLoaded({required this.cartProducts});
}
final class CartError extends CartState {
  final String message;
  const CartError({required this.message});
}