import 'package:e_commerce_app/core/utils/app_router.dart';
import 'package:e_commerce_app/features/product_details/presentation/views/widgets/product_details_body.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product, });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product Details"),
          automaticallyImplyLeading: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
          ],
        ),
        body: ProductDetailsBody(
          product: product,
          pop: () {
            context.pop();
          },
          buyNow: (){
            GoRouter.of(context).push(AppRouter.checkoutRoute);
          },
        ),
      ),
    );
  }
}
