import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/core/utils/app_router.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_google_button.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email, password;
  bool isObscurePassword = true;
  bool isObsecurePasswordConfirm = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          GoRouter.of(context).push(AppRouter.homeRoute);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        isLoading = state is AuthLoading;
        return Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100.h),
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: Text(
                      'Log in',
                      style: TextStyles.textStyle28Bold(Colors.black),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    'Email',
                    style: TextStyles.textStyle16Regular(Colors.grey),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                    hintText: "example@gmail.com",
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
                    onSaved: (value) => email = value,
                    onChanged: (value) => email = value,
                    prefixIcon: Icons.email_outlined,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Password',
                    style: TextStyles.textStyle16Regular(Colors.grey),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                    isSecure: isObscurePassword,
                    hintText: "must be at least 6 characters long",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    onSaved: (value) => password = value,
                    onChanged: (value) => password = value,
                    prefixIcon: Icons.lock_outlined,
                    onTap: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    },
                  ),
                  SizedBox(height: 20.h),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.forgetPasswordRoute); 
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyles.textStyle16Regular(Colors.black),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "Log in",
                          light: false,
                          isLoading: isLoading,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              BlocProvider.of<AuthCubit>(
                                context,
                              ).signin(email: email!, password: password!);
                            }
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
                        'or log in with',
                        style: TextStyles.textStyle14Regular(Colors.grey),
                      ),
                      Expanded(
                        child: Divider(thickness: 1.w, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CustomGoogleButton(
                    isLoading: isLoading,
                    onPressed: () {
                      context.read<AuthCubit>().loginOrRegisterWithGoogle();
                    },
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyles.textStyle14Regular(Colors.black),
                      ),
                      CustomTextButton(
                        title: 'Sign up',
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.signUpRoute);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
