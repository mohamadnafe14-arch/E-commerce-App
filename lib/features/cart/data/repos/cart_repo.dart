import 'package:e_commerce_app/features/cart/data/models/cart_model.dart';
import 'package:e_commerce_app/features/cart/data/models/order_model.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
enum OrderStatus { payed, notpayed }
enum PaymentMethod { cashOnDelivery, visa }
abstract class CartRepo {
  Future<List<CartModel>> getCart();

  Future<void> addToCart({
    required int quantity,
    required ProductModel product,
  });

  Future<void> removeFromCart({required int productId});

  Future<void> updateQuantity({
    required CartModel product,
    required int quantity,
  });
  Future<void> clearCart();
  double getTotalPrice();
  List<OrderModel> getOrders();
  void addOrder(OrderModel order);
}
