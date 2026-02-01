import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      width: 200.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Image.network(
            productModel.image ??
                "https://via.placeholder.com/300x400.png?text=No+Image",
            width: 150.w,
            height: 150.h,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.h),
          Text(
            productModel.title ?? "No Title",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.textStyle16Regular(Colors.black),
          ),
          SizedBox(height: 10.h),
          Text(
            "\$${productModel.price ?? 0.0}",
            style: TextStyles.textStyle16Regular(
              Colors.green,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            "No discount",
            style: TextStyles.textStyle16Regular(
              Colors.red,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            "Free shipping",
            style: TextStyles.textStyle14Regular(
              Colors.green,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
