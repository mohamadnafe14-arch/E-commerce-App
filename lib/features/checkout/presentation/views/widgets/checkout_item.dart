import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_model.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutItem extends StatelessWidget {
  const CheckoutItem({super.key, required this.cartModel});
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Image.network(
                cartModel.image ?? "https://via.placeholder.com/150",
                height: 60,
                width: 60,
              ),
              title: Text(
                cartModel.title ?? "no title",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "\$${cartModel.price} x ${cartModel.quantity}",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              trailing: Text(
                "\$${(cartModel.price ?? 0) * (cartModel.quantity ?? 0)}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
            CustomButton(
              text: "Delete",
              light: false,
              onPressed: () {
                BlocProvider.of<CartCubit>(
                  context,
                ).removeProductFromCart(productId: cartModel.id!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
