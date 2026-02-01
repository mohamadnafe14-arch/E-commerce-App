import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCategoryList extends StatelessWidget {
  const ProductCategoryList({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ProductCategoryItem(productModel: products[index]),
        ),
      ),
    );
  }
}
