import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/core/utils/app_router.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/e_commerce_text.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/text_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    goToPageView();
  }

  void goToPageView() {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push(AppRouter.pageViewBuilderRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 234.h),
        Icon(Icons.shopping_bag_outlined, size: 100.sp),
        SizedBox(height: 20.h),
        ECommerceText(),
        SizedBox(height: 20.h),
        Text(
          'Welcome! Your shopping journey starts here.',
          style: TextStyles.textStyle16Regular(Colors.black),
        ),
        SizedBox(height: 40.h),
        TextAnimation(slidingAnimation: slidingAnimation),
        SizedBox(height: 40.h),
      ],
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 5),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
}
