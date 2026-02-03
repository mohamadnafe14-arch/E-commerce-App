import 'package:e_commerce_app/features/cart/data/models/cart_model.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutList extends StatelessWidget {
  const CheckoutList({super.key, required this.cartItems});
  final List<CartModel> cartItems;
  @override
  Widget build(BuildContext context) {
    return cartItems.isEmpty
        ? SliverFillRemaining(
            child: const Center(child: Text("Your cart is empty")),
          )
        : SliverList.builder(
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 10.h),
              child: CheckoutItem(cartModel: cartItems[index]),
            ),
            itemCount: cartItems.length,
          );
  }
}
