import 'package:e_commerce_app/features/cart/data/models/cart_model.dart';
import 'package:e_commerce_app/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});
  final List<CartModel> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => CartItem(cartModel: cartItems[index]),
      itemCount: cartItems.length,
    );
  }
}
