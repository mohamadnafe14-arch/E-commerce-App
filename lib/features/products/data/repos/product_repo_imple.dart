import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/utils/api_service.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/data/repos/product_repo.dart';

class ProductRepoImple implements ProductRepo {
  final ApiService apiService;
  ProductRepoImple(this.apiService);
  @override
  Future<Either<Failuer, List<ProductModel>>> getProducts({
    required String category,
  }) async {
    try {
      final Map<String, dynamic> products =
          apiService.get('/products/category/$category')
              as Map<String, dynamic>;
      final List<ProductModel> productsList = [];
      products.forEach((key, value) {
        productsList.add(ProductModel.fromJson(value));
      });
      return Right(productsList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailuer.fromDioError(dioException: e));
      } else {
        return Left(ServerFailuer(message: e.toString()));
      }
    }
  }
}
