import 'package:e_commerce_app/features/auth/presentation/sign_in_view.dart';
import 'package:e_commerce_app/features/auth/presentation/sign_up_view.dart';
import 'package:e_commerce_app/features/auth/presentation/page_view_builder_view.dart';
import 'package:e_commerce_app/features/auth/presentation/views/auth_determinator_view.dart';
import 'package:e_commerce_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:e_commerce_app/features/cart/presentation/views/cart_view.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/home_view.dart';
import 'package:e_commerce_app/features/products/presentation/views/products_view.dart';
import 'package:e_commerce_app/features/auth/presentation/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String homeRoute = '/home';
  static const String productsRoute = '/products';
  static const String cartRoute = '/cart';
  static const String signInRoute = '/signIn';
  static const String signUpRoute = '/signUp';
  static const String checkoutRoute = '/checkout';
  static const String pageViewBuilderRoute = '/pageViewBuilder';
  static const String authDeterminatorRoute = '/authDeterminator';
  static const String forgetPasswordRoute = '/forgetPassword';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(path: homeRoute, builder: (context, state) => const HomeView()),
      GoRoute(
        path: productsRoute,
        builder: (context, state) => const ProductsView(),
      ),
      GoRoute(path: cartRoute, builder: (context, state) => const CartView()),
      GoRoute(
        path: checkoutRoute,
        builder: (context, state) => const CheckoutView(),
      ),
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
    ],
  );
}
