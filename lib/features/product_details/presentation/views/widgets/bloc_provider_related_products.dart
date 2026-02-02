import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/product_details/presentation/views/widgets/related_products.dart';
import 'package:e_commerce_app/features/products/data/repos/product_repo.dart';
import 'package:e_commerce_app/features/products/presentation/manager/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviderRelatedProducts extends StatelessWidget {
  const BlocProviderRelatedProducts({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(getIt.get<ProductRepo>())
            ..getProductsByCategory(category: category),
      child: RelatedProducts(category: category),
    );
  }
}
