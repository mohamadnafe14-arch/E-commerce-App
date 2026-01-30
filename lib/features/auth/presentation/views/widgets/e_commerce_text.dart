import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ECommerceText extends StatelessWidget {
  const ECommerceText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('E', style: TextStyles.textStyle28Bold(Colors.blue)),
        Text('-', style: TextStyles.textStyle28Bold(Colors.red)),
        Text('Commerce', style: TextStyles.textStyle28Bold(Colors.black)),
      ],
    );
  }
}
