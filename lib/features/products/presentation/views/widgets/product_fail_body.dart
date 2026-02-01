import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ProductFailBody extends StatelessWidget {
  const ProductFailBody({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message, style: TextStyles.textStyle28Bold(Colors.red)),
    );
  }
}
