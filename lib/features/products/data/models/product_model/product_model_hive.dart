import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/rating.dart';
import 'package:hive_flutter/adapters.dart';
part 'product_model_hive.g.dart';

@HiveType(typeId: 0)
class ProductModelHive extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  double? price;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? category;
  @HiveField(5)
  String? image;
  @HiveField(6)
  double? rate;
  @HiveField(7)
  int? count;
  ProductModelHive({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rate,
    this.count,
  });
  factory ProductModelHive.fromProductModel(ProductModel productModel) {
    return ProductModelHive(
      id: productModel.id,
      title: productModel.title,
      price: productModel.price,
      description: productModel.description,
      category: productModel.category,
      image: productModel.image,
      rate: productModel.rating?.rate,
      count: productModel.rating?.count,
    );
  }
  ProductModel toProductModel() {
    return ProductModel(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: Rating(rate: rate, count: count),
    );
  }
}
