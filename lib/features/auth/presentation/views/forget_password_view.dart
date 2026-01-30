import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/forget_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt<AuthRepo>()),
      child: SafeArea(
        child: Scaffold(appBar: AppBar(), body: ForgetPasswordBody()),
      ),
    );
  }
}
