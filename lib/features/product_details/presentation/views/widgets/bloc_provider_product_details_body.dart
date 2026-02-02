import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/product_details/presentation/views/widgets/product_details_body.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/data/repos/product_repo.dart';
import 'package:e_commerce_app/features/products/presentation/manager/favourite_cubit/favourite_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviderProductDetailsBody extends StatelessWidget {
  const BlocProviderProductDetailsBody({
    super.key,
    required this.product,
    required this.buyNow,
    required this.addToCart,
  });

  final ProductModel product;
  final VoidCallback? buyNow, addToCart;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavouriteProductsCubit(getIt.get<ProductRepo>())
            ..getFavouriteProducts(),
      child: ProductDetailsBody(product: product),
    );
  }
}