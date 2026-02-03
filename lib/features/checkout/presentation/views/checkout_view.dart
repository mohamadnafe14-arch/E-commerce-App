import 'package:e_commerce_app/core/utils/app_router.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CheckoutViewBody(
          goToPayment: () {
            GoRouter.of(context).push(AppRouter.paymentRoute);
          },
          
        ),
      ),
    );
  }
}
