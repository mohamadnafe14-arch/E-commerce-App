import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/features/products/presentation/manager/favourite_cubit/favourite_products_cubit.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_fail_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_loading_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_success_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteProducts extends StatelessWidget {
  const FavouriteProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              "Favourite Products",
              style: TextStyles.textStyle28Bold(Colors.black),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 50.h)),
          BlocBuilder<FavouriteProductsCubit, FavouriteProductsState>(
            builder: (context, state) {
              if (state is FavouriteProductsLoading) {
                return SliverFillRemaining(child: ProductLoadingBody());
              } else if (state is FavouriteProductsLoaded) {
                return ProductSuccessBody(productsList: state.productsList);
              } else if (state is FavouriteProductsError) {
                return ProductFailBody(message: state.message);
              }
              return SliverFillRemaining(child: const SizedBox());
            },
          ),
        ],
      ),
    );
  }
}
