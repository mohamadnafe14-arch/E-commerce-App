import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_model.dart';
import 'package:e_commerce_app/features/cart/data/models/order_model.dart';
import 'package:e_commerce_app/features/cart/data/repos/cart_repo.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit({required this.cartRepo})
    : super(CartInitial());
  Future<void> getCartProducts() async {
    emit(CartLoading());
    try {
      final cartProducts = await cartRepo.getCart();
      emit(CartLoaded(cartProducts: cartProducts));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> addProductToCart({
    required ProductModel product,
    required int quantity,
  }) async {
    try {
      await cartRepo.addToCart(quantity: quantity, product: product);
      getCartProducts();
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> removeProductFromCart({
    required int productId,
  }) async {
    try {
      await cartRepo.removeFromCart(productId: productId);
      getCartProducts();
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> updateQuantity({
    required CartModel product,
    required int quantity,
  }) async {
    try {
      await cartRepo.updateQuantity(
        product: product,
        quantity: quantity,
      );
      getCartProducts();
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }
  double getTotalPrice() {
    return cartRepo.getTotalPrice();
  }
  void addOrder(OrderModel order) {
    cartRepo.addOrder(order);
  }
  List<OrderModel> getOrders() {
    return cartRepo.getOrders();
  }
  void clearCart() async {
    try {
      await cartRepo.clearCart();
      getCartProducts();
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }
}
