import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/page_view_builder_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewBuilderView extends StatelessWidget {
  const PageViewBuilderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => AuthCubit(getIt<AuthRepo>()),
        child: const Scaffold(body: PageViewBuilderBody()),
      ),
    );
  }
}
