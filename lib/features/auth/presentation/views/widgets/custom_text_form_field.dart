import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    required this.onSaved,
    required this.onChanged,
    required this.prefixIcon,
    this.isSecure = false,
    this.onTap,
    this.controller,
  });
  final String hintText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? onChanged;
  final IconData? prefixIcon;
  final bool isSecure;
  final void Function()? onTap;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r)),
        hint: Text(hintText, style: TextStyle(color: Colors.grey)),
        prefixIcon: GestureDetector(onTap: onTap, child: Icon(prefixIcon)),
      ),
      obscureText: isSecure,
      validator: validator,
      onSaved: onSaved,
      onChanged:onChanged,
    );
  }
}
