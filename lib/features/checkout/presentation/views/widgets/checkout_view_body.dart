import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_list.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_fail_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_loading_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key, required this.goToPayment});
  final VoidCallback goToPayment;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          centerTitle: true,
          title: Text(
            "Checkout",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return SliverFillRemaining(child: ProductLoadingBody());
            }
            if (state is CartLoaded) {
              return CheckoutList(cartItems: state.cartProducts);
            } else if (state is CartError) {
              return SliverFillRemaining(
                child: ProductFailBody(message: state.message),
              );
            }
            return SliverToBoxAdapter(child: SizedBox());
          },
        ),
        SliverToBoxAdapter(child: SizedBox(height: 50.h)),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final hasItems =
                state is CartLoaded && state.cartProducts.isNotEmpty;
            return hasItems
                ? SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ElevatedButton(
                        onPressed: goToPayment,
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50.h),
                        ),
                        child: Text(
                          "Proceed to Payment",
                          style: TextStyles.textStyle28Bold(Colors.black),
                        ),
                      ),
                    ),
                  )
                : SliverToBoxAdapter(child: SizedBox());
          },
        ),
      ],
    );
  }
}
