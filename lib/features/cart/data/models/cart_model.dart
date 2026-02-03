import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'cart_model.g.dart';
@HiveType(typeId: 1)
class CartModel extends HiveObject {
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
  @HiveField(8)
  int? quantity;
  CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
    required this.count,
    required this.quantity,
  });
  factory CartModel.fromProductModel({
    required ProductModel productModel,
    required int quantity,
  }) {
    return CartModel(
      id: productModel.id,
      title: productModel.title,
      price: productModel.price,
      description: productModel.description,
      category: productModel.category,
      image: productModel.image,
      rate: productModel.rating?.rate,
      count: productModel.rating?.count,
      quantity: quantity,
    );
  }
}
