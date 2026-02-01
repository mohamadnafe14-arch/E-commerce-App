import 'package:e_commerce_app/core/utils/app_router.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/products/data/models/product_model/product_model_hive.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelHiveAdapter());
  await Hive.openBox<ProductModelHive>('products');
  setupServiceLocator();
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
      builder: (context, child) => MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
      ),
    );
  }
}
