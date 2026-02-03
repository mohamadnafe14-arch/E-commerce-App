import 'package:e_commerce_app/core/utils/app_router.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_model.dart';
import 'package:e_commerce_app/features/cart/data/repos/cart_repo.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model_hive.dart';
import 'package:e_commerce_app/features/products/data/repos/product_repo.dart';
import 'package:e_commerce_app/features/products/presentation/manager/favourite_cubit/favourite_products_cubit.dart';
import 'package:e_commerce_app/features/products/presentation/manager/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelHiveAdapter());
  await Hive.openBox<ProductModelHive>('products');
  Hive.registerAdapter(CartModelAdapter());
  await Hive.openBox<CartModel>('cartBox');
  setupServiceLocator();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CartCubit(cartRepo: getIt.get<CartRepo>())..getCartProducts(),
          ),
          BlocProvider(
            create: (context) =>
                FavouriteProductsCubit(getIt.get<ProductRepo>())
                  ..getFavouriteProducts(),
          ),
          BlocProvider(
            create: (context) =>
                ProductsCubit(getIt.get<ProductRepo>())..getAllProducts(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
        ),
      ),
    );
  }
}
