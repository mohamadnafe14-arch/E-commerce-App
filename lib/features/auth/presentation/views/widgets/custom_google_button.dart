import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGoogleButton extends StatefulWidget {
  const CustomGoogleButton({
    super.key,
    required this.isLoading,
    this.onPressed,
  });
  final bool isLoading;
  final void Function()? onPressed;
  @override
  State<CustomGoogleButton> createState() => _CustomGoogleButtonState();
}

class _CustomGoogleButtonState extends State<CustomGoogleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.black, width: 2.w),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.g_mobiledata_outlined, color: Colors.red),
            widget.isLoading
                ? CircularProgressIndicator(color: Colors.white)
                : Text(
                    'oogle',
                    style: TextStyles.textStyle16Regular(Colors.black),
                  ),
          ],
        ),
      ),
    );
  }
}
