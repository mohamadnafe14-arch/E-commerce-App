import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/search_products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchProductsSuccesBody extends StatelessWidget {
  const SearchProductsSuccesBody({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(kEmoji, height: 100.h),
                SizedBox(height: 20.h),
                Text(
                  "There are no suitable products",
                  style: TextStyles.textStyle28Bold(Colors.black),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Please try using other keywords to find the product name",
                  style: TextStyles.textStyle14Regular(Colors.grey),
                ),
              ],
            ),
          )
        : SearchProductsList(products: products);
  }
}
