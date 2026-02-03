import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class QuantityCounter extends StatefulWidget {
  const QuantityCounter({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
  });
  final VoidCallback? onIncrement, onDecrement;

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            widget.onDecrement!();
            if (quantity > 1) {
              setState(() {
                quantity--;
              });
            }
          },
          child: Container(
            decoration: ShapeDecoration(
              shape: CircleBorder(side: BorderSide(color: Colors.grey)),
            ),
            child: Icon(Icons.remove, color: Colors.black),
          ),
        ),
        SizedBox(width: 10),
        Text(
          quantity.toString(),
          style: TextStyles.textStyle16Regular(Colors.black),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            widget.onIncrement!();
            setState(() {
              quantity++;
            });
          },
          child: Container(
            decoration: ShapeDecoration(
              shape: CircleBorder(side: BorderSide(color: Colors.grey)),
            ),
            child: Icon(Icons.add, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
