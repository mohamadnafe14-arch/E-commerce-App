import 'package:e_commerce_app/core/constants/assets.dart';
import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/features/auth/data/models/page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.pageViewModel});
  final PageViewModel pageViewModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SvgPicture.asset(
              kPlaceHolder,
              width: 250.w,
              height: 500.h,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 60.h,
              left: 20.w,
              child: SvgPicture.asset(
                pageViewModel.image,
                width: 300.w,
                height: 300.h,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            pageViewModel.heading,
            style: TextStyles.textStyle28Bold(Colors.black),
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          pageViewModel.description,
          style: TextStyles.textStyle16Regular(Colors.black),
        ),
      ],
    );
  }
}
