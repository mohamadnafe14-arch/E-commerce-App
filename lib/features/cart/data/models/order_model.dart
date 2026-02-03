import 'package:e_commerce_app/features/cart/data/repos/cart_repo.dart';

class OrderModel {
  final double totalPrice;
  final DateTime orderDate;
  final OrderStatus status;
  final PaymentMethod paymentMethod;
  const OrderModel({
    required this.totalPrice,
    required this.orderDate,
    required this.status,
    required this.paymentMethod,
  });
}
