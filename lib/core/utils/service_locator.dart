import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/api_service.dart';
import 'package:e_commerce_app/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce_app/features/auth/data/repos/auth_repo_imple.dart';
import 'package:e_commerce_app/features/cart/data/repos/cart_repo.dart';
import 'package:e_commerce_app/features/cart/data/repos/cart_repo_impl.dart';
import 'package:e_commerce_app/features/products/data/repos/product_repo.dart';
import 'package:e_commerce_app/features/products/data/repos/product_repo_imple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImple(firebaseAuth: getIt<FirebaseAuth>()),
  );
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(ApiService(dio: getIt<Dio>()));
  getIt.registerSingleton<ProductRepo>(ProductRepoImple(getIt<ApiService>()));
  getIt.registerSingleton<CartRepo>(CartRepoImpl(getIt<ApiService>()));
}
