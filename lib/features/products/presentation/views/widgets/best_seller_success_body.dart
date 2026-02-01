import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/best_seller_list.dart';
import 'package:flutter/material.dart';

class BestSellerSuccessBody extends StatelessWidget {
  const BestSellerSuccessBody({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? const SliverFillRemaining(child: Center(child: Text("No products")))
        : SliverToBoxAdapter(child: BestSellerList(products: products));
  }
}