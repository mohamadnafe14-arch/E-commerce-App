import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/features/products/presentation/manager/all_products_cubit/all_products_cubit.dart';
import 'package:e_commerce_app/features/products/presentation/manager/best_seller_cubit/best_seller_cubit.dart';
import 'package:e_commerce_app/features/products/presentation/manager/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/best_seller_success_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/category_list.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/fake_pictures.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_categories_success_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_fail_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_loading_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_success_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsSlivers extends StatelessWidget {
  const ProductsSlivers({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          FakePictures(),
          SizedBox(height: 50.h),

          Text(
            "Categories",
            style: TextStyles.textStyle28Bold(Colors.black),
          ),
          SizedBox(height: 20.h),
          CategoryList(),
          SizedBox(height: 50.h),

          Text(
            "Recommenditions",
            style: TextStyles.textStyle28Bold(Colors.black),
          ),
          SizedBox(height: 50.h),

          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return ProductLoadingBody();
              } else if (state is ProductsLoaded) {
                return ProductCategoriesSuccessBody(
                  products: state.productsList,
                );
              } else if (state is ProductsError) {
                return ProductFailBody(message: state.message);
              }
              return const SizedBox();
            },
          ),

          SizedBox(height: 50.h),
          Image.asset(kBanner),
          SizedBox(height: 50.h),

          Text(
            "Best Sellers",
            style: TextStyles.textStyle28Bold(Colors.black),
          ),

          BlocBuilder<BestSellerCubit, BestSellerCubitState>(
            builder: (context, state) {
              if (state is BestSellerCubitLoading) {
                return ProductLoadingBody();
              } else if (state is BestSellerCubitLoaded) {
                return BestSellerSuccessBody(products: state.products);
              } else if (state is BestSellerCubitError) {
                return ProductFailBody(message: state.message);
              }
              return const SizedBox();
            },
          ),

          SizedBox(height: 50.h),

          Text(
            "Top Rated",
            style: TextStyles.textStyle28Bold(Colors.black),
          ),
          SizedBox(height: 50.h),

          BlocBuilder<AllProductsCubit, AllProductsState>(
            builder: (context, state) {
              if (state is AllProductsLoading) {
                return ProductLoadingBody();
              } else if (state is AllProductsLoaded) {
                return ProductSuccessBody(
                  productsList: state.productsList,
                );
              } else if (state is AllProductsError) {
                return ProductFailBody(message: state.message);
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

