import 'package:e_commerce_app/features/cart/data/models/cart_item_model.dart';

class CartModel {
  final int id;
  final int userId;
  final String date;
  final List<CartItemModel> items;

  CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.items,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      userId: json['userId'],
      date: json['date'],
      items: (json['products'] as List)
          .map((e) => CartItemModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'date': date,
      'products': items.map((e) => e.toJson()).toList(),
    };
  }
}
