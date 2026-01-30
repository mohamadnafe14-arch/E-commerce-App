import 'package:e_commerce_app/core/utils/app_router.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/dots_indicator.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/page_view_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PageViewBuilderBody extends StatefulWidget {
  const PageViewBuilderBody({super.key});

  @override
  State<PageViewBuilderBody> createState() => _PageViewBuilderBodyState();
}

class _PageViewBuilderBodyState extends State<PageViewBuilderBody> {
  late PageController _controller;
  int currentIndex = 0;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    _controller.addListener(() {
      setState(() {
        currentIndex = _controller.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          PageViewBuilderWidget(pageController: _controller),
          SizedBox(height: 20.h),
          DotsIndicator(currentIndex: currentIndex),
          SizedBox(height: 20.h),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: CustomButton(
                    text: 'Skip',
                    light: true,
                    onPressed: () => goToNextPage(context),
                  ),
                ),
              ),
              Expanded(
                child: CustomButton(
                  text: 'continue',
                  light: false,
                  onPressed: () => currentIndex == 2
                      ? goToNextPage(context)
                      : _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<Object?> goToNextPage(BuildContext context) {
    return BlocProvider.of<AuthCubit>(context).isLoggedIn()
        ? GoRouter.of(context).push(AppRouter.homeRoute)
        : GoRouter.of(context).push(AppRouter.authDeterminatorRoute);
  }
}
