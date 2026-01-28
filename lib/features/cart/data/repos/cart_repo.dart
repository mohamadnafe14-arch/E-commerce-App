import 'package:e_commerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_model.dart';

abstract class CartRepo {
  Future<CartModel> getCart({required int userId});

  Future<void> addToCart({required int userId, required CartItemModel item});

  Future<void> removeFromCart({required int userId, required int productId});

  Future<void> updateQuantity({
    required int userId,
    required int productId,
    required int quantity,
  });

  Future<void> clearCart({required int userId});
}
