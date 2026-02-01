import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';

abstract class ProductRepo {
  Future<Either<Failuer, List<ProductModel>>> getProductsByCategory({
    required String category,
  });
  Future<Either<Failuer, List<ProductModel>>> searchProducts({
    required String query,
  });
  Future<Either<Failuer, List<ProductModel>>> getAllProducts();
  Future<Either<Failuer, ProductModel>> getProductById({required String id});
  Future<void> addFavouriteProduct({required ProductModel productModel});
  Future<void> removeFavouriteProduct({required ProductModel productModel});
  Future<Either<Failuer, List<ProductModel>>> getFavouriteProducts();
  Future<Either<Failuer, List<ProductModel>>> getBestSellers();
  Future<Either<Failuer, List<ProductModel>>> getTopRated();
}
