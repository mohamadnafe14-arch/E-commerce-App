import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce_app/features/products/presentation/manager/search_feature_cubit/search_feature_cubit.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/custom_category_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key, required this.onConfirm});
  final VoidCallback onConfirm;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  double minmumPrice = 15;
  double maximumPrice = 350;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Filter Options",
        style: TextStyles.textStyle28Bold(Colors.black),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Category",
              style: TextStyles.textStyle16Regular(Colors.black),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomCategoryContainer(title: "electronics"),
                CustomCategoryContainer(title: "Men"),
                CustomCategoryContainer(title: "Women"),
              ],
            ),
            SizedBox(height: 20.h),
            CustomCategoryContainer(title: "jewelery"),
            SizedBox(height: 20.h),
            Text(
              "Price Range ",
              style: TextStyles.textStyle16Regular(Colors.black),
            ),
            SizedBox(height: 20.h),
            RangeSlider(
              values: RangeValues(minmumPrice, maximumPrice),
              min: 15,
              max: 350,
              divisions: 335,
              onChanged: (value) {
                setState(() {
                  minmumPrice = value.start;
                  maximumPrice = value.end;
                });
              },
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "\$${minmumPrice.toStringAsFixed(2)}",
                  style: TextStyles.textStyle16Regular(Colors.black),
                ),
                Text(
                  "\$${maximumPrice.toStringAsFixed(2)}",
                  style: TextStyles.textStyle16Regular(Colors.black),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            CustomButton(
              onPressed: () {
                context.read<SearchFeatureCubit>().changePrice(
                  minmumPrice: minmumPrice,
                  maximumPrice: maximumPrice,
                );
                widget.onConfirm();
              },
              text: "Confirm",
              light: false,
            ),
          ],
        ),
      ),
    );
  }
}