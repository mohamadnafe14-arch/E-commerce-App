import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_model.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/product_details/presentation/views/widgets/quantity_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartModel});
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.network(
            cartModel.image ?? "https://via.placeholder.com/150",
            height: 100.h,
            width: 100.w,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartModel.title ?? "no title",
                  style: TextStyles.textStyle28Bold(Colors.black),
                ),
                SizedBox(height: 5.h),
                Text(
                  "\$${cartModel.price}",
                  style: TextStyles.textStyle28Bold(Colors.black),
                ),
                SizedBox(height: 5.h),
                QuantityCounter(
                  firstQuantity: cartModel.quantity ?? 0,
                  onIncrement: () async {
                    BlocProvider.of<CartCubit>(context).updateQuantity(
                      product: cartModel,
                      quantity: (cartModel.quantity ?? 0) + 1,
                    );
                  },
                  onDecrement: () async {
                    if ((cartModel.quantity ?? 0) > 1) {
                      BlocProvider.of<CartCubit>(context).updateQuantity(
                        product: cartModel,
                        quantity: (cartModel.quantity ?? 0) - 1,
                      );
                    } else {
                      BlocProvider.of<CartCubit>(
                        context,
                      ).removeProductFromCart(productId: cartModel.id!);
                    }
                  },
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "cancel",
                        light: false,
                        onPressed: () {
                          BlocProvider.of<CartCubit>(
                            context,
                          ).removeProductFromCart(productId: cartModel.id!);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
