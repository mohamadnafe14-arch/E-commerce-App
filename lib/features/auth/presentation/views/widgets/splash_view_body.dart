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
  late Animation<Offset> ctaSlideAnimation;
  late Animation<double> ctaFadeAnimation;
  late Animation<double> logoScaleAnimation;
  late Animation<double> logoFadeAnimation;
  late Animation<Offset> titleSlideAnimation;
  late Animation<double> titleFadeAnimation;
  late Animation<double> subtitleFadeAnimation;

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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF4F7FF),
            Color(0xFFEFF7F2),
            Color(0xFFFFF4E9),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -80.h,
            right: -60.w,
            child: Container(
              width: 200.w,
              height: 200.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x1A3D5AFE),
              ),
            ),
          ),
          Positioned(
            bottom: -90.h,
            left: -70.w,
            child: Container(
              width: 220.w,
              height: 220.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x14FF6F3D),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScaleTransition(
                      scale: logoScaleAnimation,
                      child: FadeTransition(
                        opacity: logoFadeAnimation,
                        child: Container(
                          width: 110.w,
                          height: 110.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            size: 56.sp,
                            color: const Color(0xFF1E2A44),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SlideTransition(
                      position: titleSlideAnimation,
                      child: FadeTransition(
                        opacity: titleFadeAnimation,
                        child: const ECommerceText(),
                      ),
                    ),
                    SizedBox(height: 14.h),
                    FadeTransition(
                      opacity: subtitleFadeAnimation,
                      child: Text(
                        'Welcome! Your shopping journey starts here.',
                        textAlign: TextAlign.center,
                        style: TextStyles.textStyle16Regular(Colors.black),
                      ),
                    ),
                    SizedBox(height: 36.h),
                    TextAnimation(
                      slidingAnimation: ctaSlideAnimation,
                      fadeAnimation: ctaFadeAnimation,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    logoScaleAnimation = Tween<double>(begin: 0.7, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.55, curve: Curves.easeOutBack),
      ),
    );
    logoFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.45, curve: Curves.easeOut),
      ),
    );
    titleSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.25, 0.7, curve: Curves.easeOut),
      ),
    );
    titleFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.25, 0.65, curve: Curves.easeOut),
      ),
    );
    subtitleFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.35, 0.8, curve: Curves.easeOut),
      ),
    );
    ctaSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.55, 1.0, curve: Curves.easeOut),
      ),
    );
    ctaFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.55, 1.0, curve: Curves.easeOut),
      ),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
