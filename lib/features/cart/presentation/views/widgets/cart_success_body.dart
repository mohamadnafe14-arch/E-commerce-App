import 'package:e_commerce_app/features/cart/data/models/cart_model.dart';
import 'package:e_commerce_app/features/cart/presentation/views/widgets/cart_item_list.dart';
import 'package:flutter/material.dart';

class CartSuccessBody extends StatelessWidget {
  const CartSuccessBody({super.key,required this.cartItems});
  final List<CartModel> cartItems;
  @override
  Widget build(BuildContext context) {
    return  cartItems.isEmpty
        ? SliverToBoxAdapter(
            child: Center(
              child: Text("Your cart is empty"),
            ),
          )
        : CartItemList(cartItems: cartItems);
  }
}
