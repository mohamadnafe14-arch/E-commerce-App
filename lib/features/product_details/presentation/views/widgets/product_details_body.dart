import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce_app/features/product_details/presentation/views/widgets/bloc_provider_related_products.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/presentation/manager/favourite_cubit/favourite_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image(
                width: 430.w,
                height: 320.h,
                image: NetworkImage(
                  product.image ?? "https://via.placeholder.com/150",
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              product.title ?? "No Title",
              style: TextStyles.textStyle28Bold(Colors.black),
            ),
            SizedBox(height: 10.h),
            Row(
              children: List.generate(5, (index) {
                if (index + 1 > product.rating!.rate!.ceil()) {
                  return Icon(Icons.star_border, color: Colors.grey);
                }
                if (index + 1 > product.rating!.rate!.floor() &&
                    product.rating!.rate! - product.rating!.rate!.floor() <
                        0.5) {
                  return Icon(Icons.star_half_sharp, color: Colors.amber);
                }
                return Icon(Icons.star, color: Colors.amber);
              }),
            ),
            SizedBox(height: 20.h),
            Text(
              "\$${product.price ?? 0.0}",
              style: TextStyles.textStyle28Bold(Colors.black),
            ),
            SizedBox(height: 20.h),
            Text(
              "Description",
              style: TextStyles.textStyle16Regular(Colors.black),
            ),
            SizedBox(height: 10.h),
            Text(
              product.description ?? "No Description",
              style: TextStyles.textStyle14Regular(Colors.grey),
            ),
            SizedBox(height: 30.h),
            BlocBuilder<FavouriteProductsCubit, FavouriteProductsState>(
              builder: (context, state) {
                final isFavourite = BlocProvider.of<FavouriteProductsCubit>(
                  context,
                ).isFavourite(product);
                return GestureDetector(
                  onTap: () {
                    if (isFavourite) {
                      BlocProvider.of<FavouriteProductsCubit>(
                        context,
                      ).removeFavouriteProduct(productModel: product);
                    } else {
                      BlocProvider.of<FavouriteProductsCubit>(
                        context,
                      ).addFavouriteProduct(productModel: product);
                    }
                  },
                  child: Icon(
                    Icons.favorite,
                    color: isFavourite ? Colors.red : Colors.grey,
                  ),
                );
              },
            ),
            SizedBox(height: 30.h),
            Text(
              "Related Products",
              style: TextStyles.textStyle28Bold(Colors.black),
            ),
            SizedBox(height: 20.h),
            BlocProviderRelatedProducts(category: product.category!),
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Add to Cart",
                    onPressed: () {
                      // Add to cart functionality
                    },
                    light: true,
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: CustomButton(
                    text: "Buy Now",
                    onPressed: () {
                      // Buy now functionality
                    },
                    light: false,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
