import 'package:e_commerce_app/core/utils/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyCI39k9xtyqzlR8-DOOhH4Whx-j5pdEogY',
      appId: '1:288228711775:ios:3971373f38c1b0fe3a6aea',
      messagingSenderId: '288228711775',
      projectId: 'e-commerce-app-75715',
      storageBucket: 'e-commerce-app-75715.firebasestorage.app',
    ),
  );
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
