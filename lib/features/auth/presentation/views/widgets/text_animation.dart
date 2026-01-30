import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class TextAnimation extends StatelessWidget {
  const TextAnimation({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: slidingAnimation,
          child: Text(
            'Let\'s get started',
            style: TextStyles.textStyle28Bold(Colors.black),
          ),
        );
      },
    );
  }
}