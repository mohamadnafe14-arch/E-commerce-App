import 'package:e_commerce_app/features/payment/presentation/views/widgets/payment_view_body.dart';
import 'package:flutter/material.dart';

class PayementView extends StatelessWidget {
  const PayementView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Payment"),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: const PaymentViewBody(),
      ),
    );
  }
}
