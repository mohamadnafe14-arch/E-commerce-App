import 'package:e_commerce_app/core/utils/app_router.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce_app/features/cart/data/models/order_model.dart';
import 'package:e_commerce_app/features/cart/data/repos/cart_repo.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key});

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  PaymentMethod _method = PaymentMethod.cashOnDelivery;
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _cardHolder = TextEditingController();
  final TextEditingController _expiry = TextEditingController();
  final TextEditingController _cvv = TextEditingController();

  @override
  void dispose() {
    _cardNumber.dispose();
    _cardHolder.dispose();
    _expiry.dispose();
    _cvv.dispose();
    super.dispose();
  }

  bool _visaFieldsValid() {
    return _cardNumber.text.trim().isNotEmpty &&
        _cardHolder.text.trim().isNotEmpty &&
        _expiry.text.trim().isNotEmpty &&
        _cvv.text.trim().isNotEmpty;
  }

  Future<void> _placeOrder(BuildContext context) async {
    final cartCubit = context.read<CartCubit>();
    final total = cartCubit.getTotalPrice();
    if (total <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Your cart is empty.')));
      return;
    }
    if (_method == PaymentMethod.visa && !_visaFieldsValid()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all card fields.')),
      );
      return;
    }

    cartCubit.addOrder(
      OrderModel(
        totalPrice: total,
        orderDate: DateTime.now(),
        status: _method == PaymentMethod.visa
            ? OrderStatus.payed
            : OrderStatus.notpayed,
        paymentMethod: _method,
      ),
    );
    cartCubit.clearCart();

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final message = _method == PaymentMethod.visa
            ? 'Payment successful!'
            : 'Order placed successfully!';
        return AlertDialog(
          title: const Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    final user = FirebaseAuth.instance.currentUser;
    if (user != null && context.mounted) {
      GoRouter.of(context).go(AppRouter.homeRoute, extra: user);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, bottomInset + 16.h),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      final cartCubit = context.read<CartCubit>();
                      final totalPrice = cartCubit.getTotalPrice();
                      return Text(
                        "Total Price: \$${totalPrice.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "No discounts available at the moment.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Method',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      RadioListTile<PaymentMethod>(
                        value: PaymentMethod.cashOnDelivery,

                        // ignore: deprecated_member_use
                        groupValue: _method,

                        // ignore: deprecated_member_use
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() => _method = value);
                        },
                        title: const Text('Cash on delivery'),
                      ),
                      RadioListTile<PaymentMethod>(
                        value: PaymentMethod.visa,

                        // ignore: deprecated_member_use
                        groupValue: _method,

                        // ignore: deprecated_member_use
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() => _method = value);
                        },
                        title: const Text('Visa / Card'),
                      ),
                      if (_method == PaymentMethod.visa) ...[
                        TextField(
                          controller: _cardNumber,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Card Number',
                          ),
                        ),
                        TextField(
                          controller: _cardHolder,
                          decoration: const InputDecoration(
                            labelText: 'Cardholder Name',
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _expiry,
                                decoration: const InputDecoration(
                                  labelText: 'Expiry (MM/YY)',
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: TextField(
                                controller: _cvv,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'CVV',
                                ),
                                obscureText: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                      SizedBox(height: 16.h),
                      CustomButton(
                        text: _method == PaymentMethod.cashOnDelivery
                            ? 'Pay on Delivery'
                            : 'Pay with Visa',
                        light: false,
                        onPressed: () => _placeOrder(context),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
