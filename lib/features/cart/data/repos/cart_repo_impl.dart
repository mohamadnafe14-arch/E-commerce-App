import 'package:e_commerce_app/core/utils/api_service.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_item_model.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_model.dart';
import 'package:e_commerce_app/features/cart/data/repos/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final ApiService apiService;
  CartRepoImpl(this.apiService);
  @override
  Future<void> addToCart({
    required int userId,
    required CartItemModel item,
  }) async {
    final cart = await apiService.get('/cart/$userId');
    final CartModel cartModel = CartModel.fromJson(cart);
    cartModel.items.add(item);
    await apiService.post('/cart/$userId', cartModel.toJson());
  }

  @override
  Future<void> clearCart({required int userId}) async {
    final cart = await apiService.get('/cart/$userId');
    final CartModel cartModel = CartModel.fromJson(cart);
    cartModel.items.clear();
    await apiService.post('/cart/$userId', cartModel.toJson());
  }

  @override
  Future<CartModel> getCart({required int userId}) async {
    final cart = await apiService.get('/cart/$userId');
    return CartModel.fromJson(cart);
  }

  @override
  Future<void> removeFromCart({
    required int userId,
    required int productId,
  }) async {
    await apiService.delete('/cart/$userId/$productId');
  }

  @override
  Future<void> updateQuantity({
    required int userId,
    required int productId,
    required int quantity,
  }) async {
    final cart = await apiService.get('/cart/$userId');
    final CartModel cartModel = CartModel.fromJson(cart);
    cartModel.items
            .firstWhere((element) => element.productId == productId)
            .quantity =
        quantity;
    await apiService.post('/cart/$userId', cartModel.toJson());
  }
}
