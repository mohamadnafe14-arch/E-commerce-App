import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/presentation/manager/favourite_cubit/favourite_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          child: Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          productModel.title ?? '',
                          maxLines: 2, // أو 3 حسب الديزاين
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r"$" + productModel.price.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BlocBuilder<
                        FavouriteProductsCubit,
                        FavouriteProductsState
                      >(
                        builder: (context, state) {
                          final isFavourite =
                              BlocProvider.of<FavouriteProductsCubit>(
                                context,
                              ).isFavourite(productModel);
                          return GestureDetector(
                            onTap: () {
                              if (isFavourite) {
                                BlocProvider.of<FavouriteProductsCubit>(
                                  context,
                                ).removeFavouriteProduct(
                                  productModel: productModel,
                                );
                              } else {
                                BlocProvider.of<FavouriteProductsCubit>(
                                  context,
                                ).addFavouriteProduct(
                                  productModel: productModel,
                                );
                              }
                            },
                            child: Icon(
                              Icons.favorite,
                              color: isFavourite ? Colors.red : Colors.grey,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -32.h,
          right: 32.w,
          child: Image.network(
            productModel.image!,
            width: 100.w,
            height: 100.h,
          ),
        ),
      ],
    );
  }
}
