import 'package:flutter/material.dart';

class ProductLoadingBody extends StatelessWidget {
  const ProductLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
