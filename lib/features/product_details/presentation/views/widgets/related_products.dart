import 'package:e_commerce_app/features/product_details/presentation/views/widgets/related_products_item.dart';
import 'package:e_commerce_app/features/products/presentation/manager/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_fail_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_loading_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedProducts extends StatelessWidget {
  const RelatedProducts({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsError) {
          return ProductFailBody(message: state.message);
        } else if (state is ProductsLoaded) {
          return SizedBox(
            height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: RelatedProductsItem(
                  image: state.productsList[index].image ?? "",
                ),
              ),
              itemCount: state.productsList.length,
            ),
          );
        }
        return const ProductLoadingBody();
      },
    );
  }
}
