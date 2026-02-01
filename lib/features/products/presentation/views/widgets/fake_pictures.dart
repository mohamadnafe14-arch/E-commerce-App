import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FakePictures extends StatelessWidget {
  const FakePictures({super.key});
  static const List<String> images = [
    kfirstFakePage,
    ksecondFakePage,
    kthirdFakePage,
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          3,
          (index) => Padding(
            padding: EdgeInsets.only(right: 10),
            child: Container(
              height: 300.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Image(image: AssetImage(images[index]), fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
