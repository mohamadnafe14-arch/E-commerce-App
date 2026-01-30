import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.light,
    this.isLoading = false,
  });
  final void Function()? onPressed;
  final String text;
  final bool light;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: light ? Colors.white : Color(0xff4F46E5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(
            color: light ? Color(0xff4F46E5) : Colors.white,
            width: 2.w,
          ),
        ),
        minimumSize: Size(double.infinity, 60.h),
      ),
      child: isLoading
          ? CircularProgressIndicator(color: Colors.black)
          : Text(
              text,
              style: light
                  ? TextStyles.textStyle16Regular(Color(0xff4F46E5))
                  : TextStyles.textStyle16Regular(Colors.black),
            ),
    );
  }
}
