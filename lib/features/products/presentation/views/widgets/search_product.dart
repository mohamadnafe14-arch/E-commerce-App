import 'package:e_commerce_app/features/products/presentation/manager/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/custom_search_text_field.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_fail_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_loading_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_success_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomSearchTextField(
              onChanged: (value) => BlocProvider.of<ProductsCubit>(
                context,
              ).searchProducts(query: value),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 50.h)),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return SliverFillRemaining(child: ProductLoadingBody());
              } else if (state is ProductsLoaded) {
                return ProductSuccessBody(productsList: state.productsList);
              } else if (state is ProductsError) {
                return SliverToBoxAdapter(
                  child: ProductFailBody(message: state.message),
                );
              }
              return SliverToBoxAdapter(child: const SizedBox());
            },
          ),
        ],
      ),
    );
  }
}
