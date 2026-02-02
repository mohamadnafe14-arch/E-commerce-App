import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/features/products/presentation/manager/search_feature_cubit/search_feature_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryContainer extends StatefulWidget {
  const CustomCategoryContainer({super.key, required this.title});
  final String title;
  @override
  State<CustomCategoryContainer> createState() =>
      _CustomCategoryContainerState();
}

class _CustomCategoryContainerState extends State<CustomCategoryContainer> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        if (isSelected) {
          if (widget.title == "Men") {
            BlocProvider.of<SearchFeatureCubit>(
              context,
            ).addCategory(category: "${widget.title}'s clothing");
            return;
          } else if (widget.title == "Women") {
            BlocProvider.of<SearchFeatureCubit>(
              context,
            ).addCategory(category: "${widget.title}'s clothing");
            return;
          }
          BlocProvider.of<SearchFeatureCubit>(
            context,
          ).addCategory(category: widget.title);
        } else {
          BlocProvider.of<SearchFeatureCubit>(
            context,
          ).removeCategory(category: widget.title);
        }
      },
      child: Container(
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff4F46E5) : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          widget.title,
          style: TextStyles.textStyle16Regular(
            isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
