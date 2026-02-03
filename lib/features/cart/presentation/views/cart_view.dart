import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/presentation/views/widgets/cart_success_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_fail_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_loading_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Center(
            child: Text(
              "Cart",
              style: TextStyles.textStyle28Bold(Colors.black),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: Divider()),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return SliverToBoxAdapter(child: ProductLoadingBody());
            } else if (state is CartLoaded) {
              return CartSuccessBody(cartItems: state.cartProducts);
            } else if (state is CartError) {
              return SliverToBoxAdapter(
                child: ProductFailBody(message: state.message),
              );
            }
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "Your cart is empty",
                  style: TextStyles.textStyle16Regular(Colors.grey),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
