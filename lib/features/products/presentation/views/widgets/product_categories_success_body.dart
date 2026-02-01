import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_category_list.dart';
import 'package:flutter/material.dart';

class ProductCategoriesSuccessBody extends StatelessWidget {
  const ProductCategoriesSuccessBody({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? const SliverFillRemaining(child: Center(child: Text("No products")))
        : SliverToBoxAdapter(child: ProductCategoryList(products: products));
  }
}
