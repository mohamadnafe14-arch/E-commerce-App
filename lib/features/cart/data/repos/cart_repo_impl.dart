import 'package:e_commerce_app/features/cart/data/models/cart_model.dart';
import 'package:e_commerce_app/features/cart/data/repos/cart_repo.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartRepoImpl implements CartRepo {
  @override
  Future<void> addToCart({
    required int quantity,
    required ProductModel product,
  }) async {
    final box = Hive.box<CartModel>('cartBox');
    final cartItem = CartModel.fromProductModel(
      productModel: product,
      quantity: quantity,
    );
    box.put(product.id, cartItem);
  }

  @override
  Future<void> clearCart() async {
    final box = Hive.box<CartModel>('cartBox');
    await box.clear();
  }

  @override
  Future<List<CartModel>> getCart() async {
    final box = Hive.box<CartModel>('cartBox');
    return box.values.toList();
  }

  @override
  Future<void> removeFromCart({
    required int productId,
  }) async {
    final box = Hive.box<CartModel>('cartBox');
    await box.delete(productId);
  }

  @override
  Future<void> updateQuantity({
    required CartModel product,
    required int quantity,
  }) async {
    final box = Hive.box<CartModel>('cartBox');
    final cartItem = box.get(product.id);
    if (cartItem != null) {
      cartItem.quantity = quantity;
      await box.put(product.id, cartItem);
    }
  }
}
