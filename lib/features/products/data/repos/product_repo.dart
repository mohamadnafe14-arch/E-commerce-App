import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';

abstract class ProductRepo {
  Future<Either<Failuer, List<ProductModel>>> getProducts({
    required String category,
   });
}
