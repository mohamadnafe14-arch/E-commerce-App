import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuantityCounter extends StatefulWidget {
  QuantityCounter({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
    required this.firstQuantity,
  });
  final VoidCallback? onIncrement, onDecrement;
  int firstQuantity;
  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            widget.onDecrement!();
            if (widget.firstQuantity > 1) {
              setState(() {
                widget.firstQuantity--;
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
          widget.firstQuantity.toString(),
          style: TextStyles.textStyle16Regular(Colors.black),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            widget.onIncrement!();
            setState(() {
              widget.firstQuantity++;
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
