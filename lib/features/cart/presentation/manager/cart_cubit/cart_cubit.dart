import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_model.dart';
import 'package:e_commerce_app/features/cart/data/repos/cart_repo.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit(this.cartRepo) : super(CartInitial());
  Future<void> getCartProducts({required int userId}) async {
    emit(CartLoading());
    try {
      final cartModel = await cartRepo.getCart(userId: userId);
      emit(CartLoaded(cartProducts: cartModel));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> addProductToCart({
    required int userId,
    required CartItemModel cartItemModel,
  }) async {
    try {
      await cartRepo.addToCart(userId: userId, item: cartItemModel);
      getCartProducts(userId: userId);
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> removeProductFromCart({
    required int userId,
    required int productId,
  }) async {
    try {
      await cartRepo.removeFromCart(userId: userId, productId: productId);
      getCartProducts(userId: userId);
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> updateQuantity({
    required int userId,
    required int productId,
    required int quantity,
  }) async {
    try {
      await cartRepo.updateQuantity(
        userId: userId,
        productId: productId,
        quantity: quantity,
      );
      getCartProducts(userId: userId);
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }
}
