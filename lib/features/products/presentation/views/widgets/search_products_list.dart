import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/features/product_details/presentation/views/product_details_view.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

class SearchProductsList extends StatelessWidget {
  const SearchProductsList({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsView(product: products[index]),
              ),
            );
          },
          child: Column(
            children: [
              Text(
                products[index].title ?? "No Title",
                style: TextStyles.textStyle16Regular(Colors.grey),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.shade300, thickness: 1),
            ],
          ),
        );
      },
    );
  }
}
