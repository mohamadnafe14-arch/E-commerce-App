import 'package:e_commerce_app/core/styles/text_styles.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/products/data/repos/product_repo.dart';
import 'package:e_commerce_app/features/products/presentation/manager/search_feature_cubit/search_feature_cubit.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/custom_dialog.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/custom_search_text_field.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_fail_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/product_loading_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/search_products_succes_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SearchProduct extends StatelessWidget {
  SearchProduct({super.key});
  String query = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchFeatureCubit(getIt.get<ProductRepo>())
            ..changeQuery(query: query),
      child: Builder(
        // ← أضف Builder هنا
        builder: (context) {
          // ← الـ context ده تحت الـ BlocProvider
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CustomSearchTextField(
                    onChanged: (value) {
                      context.read<SearchFeatureCubit>().changeQuery(
                        query: value,
                      );
                    },
                    onTap: () {
                      final searchCubit = context.read<SearchFeatureCubit>();
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (dialogContext) => BlocProvider.value(
                          value: searchCubit, 
                          child: CustomDialog(
                            onConfirm: () {
                              searchCubit.changeQuery(query: query);
                              Navigator.pop(dialogContext);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 50.h)),
                SliverToBoxAdapter(
                  child: Text(
                    "Search Results",
                    style: TextStyles.textStyle16Regular(Colors.grey),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                BlocBuilder<SearchFeatureCubit, SearchFeatureState>(
                  builder: (context, state) {
                    if (state is SearchFeatureLoading) {
                      return SliverFillRemaining(child: ProductLoadingBody());
                    } else if (state is SearchFeatureLoaded) {
                      return SearchProductsSuccesBody(products: state.products);
                    } else if (state is SearchFeatureError) {
                      return SliverToBoxAdapter(
                        child: ProductFailBody(message: state.message),
                      );
                    }
                    return SliverToBoxAdapter(child: const SizedBox());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
