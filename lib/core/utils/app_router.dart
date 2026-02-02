import 'package:e_commerce_app/features/auth/presentation/sign_in_view.dart';
import 'package:e_commerce_app/features/auth/presentation/sign_up_view.dart';
import 'package:e_commerce_app/features/auth/presentation/page_view_builder_view.dart';
import 'package:e_commerce_app/features/auth/presentation/views/auth_determinator_view.dart';
import 'package:e_commerce_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:e_commerce_app/features/cart/presentation/views/cart_view.dart';
import 'package:e_commerce_app/features/product_details/presentation/views/product_details_view.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model.dart';
import 'package:e_commerce_app/features/products/presentation/views/home_view.dart';
import 'package:e_commerce_app/features/auth/presentation/splash_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String homeRoute = '/home';
  static const String cartRoute = '/cart';
  static const String signInRoute = '/signIn';
  static const String signUpRoute = '/signUp';
  static const String pageViewBuilderRoute = '/pageViewBuilder';
  static const String authDeterminatorRoute = '/authDeterminator';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String productDetailsRoute = '/productDetails';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeRoute,
        builder: (context, state) {
          final User user = state.extra as User;
          return HomeView(currentUser: user);
        },
      ),

      GoRoute(path: cartRoute, builder: (context, state) => const CartView()),

      GoRoute(path: signInRoute, builder: (context, state) => const SignIn()),
      GoRoute(
        path: signUpRoute,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: pageViewBuilderRoute,
        builder: (context, state) => const PageViewBuilderView(),
      ),
      GoRoute(
        path: authDeterminatorRoute,
        builder: (context, state) => const AuthDeterminatorView(),
      ),
      GoRoute(
        path: forgetPasswordRoute,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: productDetailsRoute,
        builder: (context, state) {
          final ProductModel productModel = state.extra as ProductModel;
          return ProductDetailsView(product: productModel);
        },
      ),
    ],
  );
}
