import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/features/products/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryModel,
    required this.isSelected,
  });
  final CategoryModel categoryModel;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.black, width: 2.w),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(categoryModel.icon, color: Colors.black),
          SizedBox(width: 10.w),
          Text(
            categoryModel.title,
            style: TextStyles.textStyle16Regular(Colors.black),
          ),
        ],
      ),
    );
  }
}
