import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_dot_indicator.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key, required this.currentIndex});
  final int currentIndex ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 6),
          child:  CustomDotIndicator(
            isActive: currentIndex == index,
          ),
        ),
      ),
    );
  }
}
