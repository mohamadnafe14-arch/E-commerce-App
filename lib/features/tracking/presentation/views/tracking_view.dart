import 'package:e_commerce_app/features/cart/data/repos/cart_repo.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackingView extends StatelessWidget {
  const TrackingView({super.key});

  String _formatDate(DateTime dateTime) {
    final local = dateTime.toLocal();
    final yyyy = local.year.toString().padLeft(4, '0');
    final mm = local.month.toString().padLeft(2, '0');
    final dd = local.day.toString().padLeft(2, '0');
    final hh = local.hour.toString().padLeft(2, '0');
    final min = local.minute.toString().padLeft(2, '0');
    return '$yyyy-$mm-$dd  $hh:$min';
  }

  String _statusText(OrderStatus status) {
    return status == OrderStatus.payed ? 'Paid' : 'Not paid';
  }

  String _methodText(PaymentMethod method) {
    return method == PaymentMethod.visa ? 'Visa' : 'Cash on delivery';
  }

  @override
  Widget build(BuildContext context) {
    final orders = context.read<CartCubit>().getOrders();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order Tracking'),
          centerTitle: true,
        ),
        body: orders.isEmpty
            ? Center(
                child: Text(
                  'No orders yet.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            : ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Container(
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order #${index + 1}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 6.h),
                        Text('Date: ${_formatDate(order.orderDate)}'),
                        Text(
                          'Total: \$${order.totalPrice.toStringAsFixed(2)}',
                        ),
                        Text('Payment: ${_methodText(order.paymentMethod)}'),
                        Text('Status: ${_statusText(order.status)}'),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemCount: orders.length,
              ),
      ),
    );
  }
}
