import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/presentation/manager/favourite_cubit/favourite_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 250.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.black, width: 2.w),
      ),
      child: Stack(
        children: [
          /// IMAGE BACKGROUND
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.network(
              productModel.image ??
                  'https://via.placeholder.com/300x400.png?text=No+Image',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.black.withValues(alpha: .35),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          (productModel.rating?.rate ?? 0).toString(),
                          style: TextStyles.textStyle14Regular(Colors.white),
                        ),
                        const Icon(Icons.star, color: Colors.yellow, size: 14),
                      ],
                    ),
                    BlocBuilder<FavouriteProductsCubit, FavouriteProductsState>(
                      builder: (context, state) {
                        final isFav = context
                            .read<FavouriteProductsCubit>()
                            .isFavourite(productModel);

                        return IconButton(
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Colors.red : Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            isFav
                                ? context
                                      .read<FavouriteProductsCubit>()
                                      .removeFavouriteProduct(
                                        productModel: productModel,
                                      )
                                : context
                                      .read<FavouriteProductsCubit>()
                                      .addFavouriteProduct(
                                        productModel: productModel,
                                      );
                          },
                        );
                      },
                    ),
                  ],
                ),

                const Spacer(),
                Text(
                  productModel.title ?? 'No Title',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.textStyle14Regular(Colors.white),
                ),
                SizedBox(height: 4.h),
                Text(
                  "\$${productModel.price ?? 0}",
                  style: TextStyles.textStyle16Regular(
                    Colors.redAccent,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6.h),
                SizedBox(
                  width: double.infinity,
                  height: 30.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
