import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/utils/api_service.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model_hive.dart';
import 'package:e_commerce_app/features/products/data/repos/product_repo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductRepoImple implements ProductRepo {
  final ApiService apiService;
  ProductRepoImple(this.apiService);
  @override
  Future<Either<Failuer, List<ProductModel>>> getProductsByCategory({
    required String category,
  }) async {
    try {
      final List products = await apiService.get(
        '/products/category/$category',
      );
      final productsList = products
          .map<ProductModel>(
            (json) => ProductModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
      return Right(productsList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailuer.fromDioError(dioException: e));
      } else {
        return Left(ServerFailuer(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failuer, List<ProductModel>>> getAllProducts() async {
    try {
      final List response = await apiService.get('/products');
      final productsList = response
          .map<ProductModel>(
            (json) => ProductModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
      return Right(productsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailuer.fromDioError(dioException: e));
      } else {
        return Left(ServerFailuer(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failuer, ProductModel>> getProductById({
    required String id,
  }) async {
    try {
      final Map<String, dynamic> product = await apiService.get(
        '/products/$id',
      );
      return Right(ProductModel.fromJson(product));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailuer.fromDioError(dioException: e));
      } else {
        return Left(ServerFailuer(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failuer, List<ProductModel>>> searchProducts({
    required String query,
    required String? category,
    required double minmumPrice,
    required double maximumPrice,
  }) async {
    try {
      final List response = await apiService.get('/products');
      final productsList = response
          .map<ProductModel>(
            (json) => ProductModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
      final List<String> categoryList = category != null
          ? category.split(',').map((e) => e.toLowerCase()).toList()
          : [];    
      productsList.removeWhere(
        (element) =>
            element.price! < minmumPrice || element.price! > maximumPrice,
      );
      productsList.removeWhere(
        (element) =>
            !element.title!.toLowerCase().contains(query.toLowerCase()),
      );
      if (category != null) {
        productsList.removeWhere(
          (element) =>
              !categoryList.contains(element.category!.toLowerCase()),
        );
      }
      return Right(productsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailuer.fromDioError(dioException: e));
      } else {
        return Left(ServerFailuer(message: e.toString()));
      }
    }
  }

  @override
  Future<void> addFavouriteProduct({required ProductModel productModel}) async {
    final box = Hive.box<ProductModelHive>('products');
    await box.add(ProductModelHive.fromProductModel(productModel));
  }

  @override
  Future<Either<Failuer, List<ProductModel>>> getFavouriteProducts() async {
    try {
      final box = Hive.box<ProductModelHive>('products');
      final products = box.values.toList();
      return Right(products.map((e) => e.toProductModel()).toList());
    } on Exception catch (e) {
      return Left(ServerFailuer(message: e.toString()));
    }
  }

  @override
  Future<void> removeFavouriteProduct({
    required ProductModel productModel,
  }) async {
    final box = Hive.box<ProductModelHive>('products');
    dynamic keyToDelete;
    for (var key in box.keys) {
      final product = box.get(key);
      if (product != null && product.id == productModel.id) {
        keyToDelete = key;
        break;
      }
    }
    if (keyToDelete != null) {
      await box.delete(keyToDelete);
    }
  }

  @override
  Future<Either<Failuer, List<ProductModel>>> getBestSellers() async {
    try {
      final carts = await apiService.get('/carts');

      if (carts.isEmpty) {
        final allProductsEither = await getAllProducts();
        return allProductsEither.fold((l) => Left(l), (products) {
          products.sort(
            (a, b) => (b.rating?.count ?? 0).compareTo(a.rating?.count ?? 0),
          );
          return Right(products.take(5).toList());
        });
      }

      Map<int, int> salesCount = {};
      for (var cart in carts) {
        for (var product in cart['products']) {
          int productId = product['productId'];
          int quantity = product['quantity'];
          salesCount[productId] = (salesCount[productId] ?? 0) + quantity;
        }
      }

      final sortedProducts = salesCount.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      final bestSellerIds = sortedProducts.take(5).map((e) => e.key).toList();

      List<ProductModel> bestSellers = [];
      for (var id in bestSellerIds) {
        final productEither = await getProductById(id: id.toString());
        productEither.fold((l) {}, (r) => bestSellers.add(r));
      }

      return Right(bestSellers);
    } catch (e) {
      return Left(ServerFailuer(message: e.toString()));
    }
  }

  @override
  Future<Either<Failuer, List<ProductModel>>> getTopRated() async {
    try {
      final List response = await apiService.get('/products');
      final productsList = response
          .map<ProductModel>(
            (json) => ProductModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
      productsList.sort(
        (a, b) => (b.rating?.rate ?? 0).compareTo(a.rating?.rate ?? 0),
      );
      return (Right(productsList));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailuer.fromDioError(dioException: e));
      } else {
        return Left(ServerFailuer(message: e.toString()));
      }
    }
  }
}
