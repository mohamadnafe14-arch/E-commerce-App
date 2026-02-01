import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.grey),
        fillColor: Color(0xffD1D5DB),
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.r)),
        hint: Text(
          'Search for products',
          style: TextStyles.textStyle16Regular(Colors.grey),
        ),
      ),
    );
  }
}
