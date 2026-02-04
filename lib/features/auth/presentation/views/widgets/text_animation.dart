import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class TextAnimation extends StatelessWidget {
  const TextAnimation({
    super.key,
    required this.slidingAnimation,
    required this.fadeAnimation,
  });

  final Animation<Offset> slidingAnimation;
  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: slidingAnimation,
        child: Text(
          'Let\'s get started',
          style: TextStyles.textStyle28Bold(Colors.black),
        ),
      ),
    );
  }
}
