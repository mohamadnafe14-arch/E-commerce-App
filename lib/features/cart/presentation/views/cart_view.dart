import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/presentation/views/widgets/cart_success_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_fail_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_loading_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key, required this.onItemClicked});
  final VoidCallback onItemClicked;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
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
              return CartSuccessBody(
                cartItems: state.cartProducts,
                onItemClicked: widget.onItemClicked,
              );
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
        const SliverToBoxAdapter(child: Divider()),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final hasItems =
                state is CartLoaded && state.cartProducts.isNotEmpty;
            return hasItems
                ? SliverToBoxAdapter(
                    child: CustomButton(
                      text: "Checkout",
                      light: false,
                      onPressed: widget.onItemClicked,
                    ),
                  )
                : const SliverToBoxAdapter(child: SizedBox.shrink());
          },
        ),
      ],
    );
  }
}
