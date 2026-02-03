import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/cart/presentation/views/cart_view.dart';
import 'package:e_commerce_app/features/products/data/repos/product_repo.dart';
import 'package:e_commerce_app/features/products/presentation/manager/all_products_cubit/all_products_cubit.dart';
import 'package:e_commerce_app/features/products/presentation/manager/best_seller_cubit/best_seller_cubit.dart';
import 'package:e_commerce_app/features/favourite/presentation/views/widgets/favourite_products.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/products_view_body.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/search_product.dart';
import 'package:e_commerce_app/features/products/presentation/views/widgets/user_info_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.currentUser});
  final User currentUser;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllProductsCubit>(
          create: (context) =>
              AllProductsCubit(getIt.get<ProductRepo>())..getTopRated(),
        ),
        BlocProvider<BestSellerCubit>(
          create: (context) =>
              BestSellerCubit(getIt.get<ProductRepo>())..getBestSellers(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: UserInfoWidget(user: widget.currentUser),
            automaticallyImplyLeading: false,
            actions: [
              Container(
                height: 40.h,
                padding: EdgeInsetsDirectional.only(bottom: 10.h),
                decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  color: Colors.grey,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications, color: Colors.black),
                ),
              ),
              Container(
                height: 40.h,
                padding: EdgeInsetsDirectional.only(bottom: 10.h),
                decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  color: Colors.grey,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.truck),
                ),
              ),
            ],
          ),
          body: IndexedStack(
            index: currentIndex,
            children: [
              ProductsViewBody(),
              FavouriteProducts(),
              SearchProduct(),
              CartView(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: false,

            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,

            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
