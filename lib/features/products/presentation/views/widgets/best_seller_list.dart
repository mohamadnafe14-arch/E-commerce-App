import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(236, 236, 252, 1)),
      child: SizedBox(
        height: 320.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: BestSellerItem(productModel: products[index]),
          ),
        ),
      ),
    );
  }
}
