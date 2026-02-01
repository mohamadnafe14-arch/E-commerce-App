import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.productsList});
  final List<ProductModel> productsList;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 30.h),
          child: ProductItem(productModel: productsList[index]),
        );
      }, childCount: productsList.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: .75,
      ),
    );
  }
}
