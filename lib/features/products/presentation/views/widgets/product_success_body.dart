import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_list.dart';
import 'package:flutter/material.dart';

class ProductSuccessBody extends StatelessWidget {
  const ProductSuccessBody({super.key, required this.productsList});
  final List<ProductModel> productsList;
  @override
  Widget build(BuildContext context) {
    return productsList.isEmpty
        ? SliverFillRemaining(child: const Center(child: Text('No products')))
        : ProductList(productsList: productsList);
  }
}
