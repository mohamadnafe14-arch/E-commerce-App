import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/core/utils/app_router.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_google_button.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/e_commerce_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AuthDeteriminationBody extends StatefulWidget {
  const AuthDeteriminationBody({super.key});

  @override
  State<AuthDeteriminationBody> createState() => _AuthDeteriminationBodyState();
}

class _AuthDeteriminationBodyState extends State<AuthDeteriminationBody> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 100.h),
          Icon(Icons.shopping_bag_outlined, size: 100.sp),
          SizedBox(height: 20.h),
          ECommerceText(),
          SizedBox(height: 20.h),
          Text(
            'Welcome. Let’s start by creating your account or sign in if you already have one',
            style: TextStyles.textStyle16Regular(
              Colors.black,
            ).copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 40.h),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Sign up',
                  light: false,
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.signUpRoute);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Sign in',
                  light: true,
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.signInRoute);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Divider(thickness: 1.w, color: Colors.grey),
              ),
              Text(
                'or register with',
                style: TextStyles.textStyle14Regular(Colors.grey),
              ),
              Expanded(
                child: Divider(thickness: 1.w, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                isLoading = true;
                setState(() {});
              } else if (state is AuthSuccess) {
                isLoading = false;
                setState(() {});
                GoRouter.of(context).push(AppRouter.homeRoute);
              } else if (state is AuthError) {
                isLoading = false;
                setState(() {});
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: CustomGoogleButton(
              isLoading: isLoading,
              onPressed: () {
                context.read<AuthCubit>().loginOrRegisterWithGoogle();
              },
            ),
          ),
          Spacer(),
          Text(
            "From cutting-edge electronics to timeless jewelry, from stylish men’s wear to elegant women’s fashion — our app brings together everything you love, all in one place. Discover variety, embrace style, and enjoy shopping like never before.",
            style: TextStyles.textStyle14Regular(Colors.grey),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
