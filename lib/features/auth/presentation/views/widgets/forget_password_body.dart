import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/core/utils/app_router.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final formKey = GlobalKey<FormState>();
  String? email;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.h),
              Align(
                alignment: AlignmentGeometry.center,
                child: Text(
                  'Forgot password?',
                  style: TextStyles.textStyle28Bold(Colors.black),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Don’t worry! It happens. Please enter the email associated with your account.",
                style: TextStyles.textStyle16Regular(Colors.grey),
              ),
              SizedBox(height: 20.h),
              Text(
                "Email Address",
                style: TextStyles.textStyle16Regular(Colors.black),
              ),
              SizedBox(height: 10.h),
              TextFormField(
                onChanged: (value) => email = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (newValue) => email = newValue,
                decoration: InputDecoration(
                  fillColor: Color(0xffD1D5DB),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  hint: Text(
                    'Enter your email address',
                    style: TextStyles.textStyle16Regular(Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: BlocListener<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          successState(context);
                        } else if (state is AuthError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                          isLoading = false;
                          setState(() {});
                        } else if (state is AuthLoading) {
                          isLoading = true;
                          setState(() {});
                        }
                      },
                      child: CustomButton(
                        text: 'Email me a reset link',
                        light: false,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            context.read<AuthCubit>().forgotPassword(
                              email: email!,
                            );
                          }
                        },
                        isLoading: isLoading,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Remember your password?",
                    style: TextStyles.textStyle16Regular(Colors.grey),
                  ),
                  CustomTextButton(
                    title: 'Login',
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.signInRoute);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void successState(BuildContext context) {
     ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'If this email exists, a reset link has been sent',
        ),
        duration: Duration(seconds: 2),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push(AppRouter.signInRoute);
    });
    isLoading = false;
    setState(() {});
  }
}
