import 'package:e_commerce_app/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce_app/features/auth/data/repos/auth_repo_imple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;

void setupServiceLocator(){
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<AuthRepo>(AuthRepoImple(
    firebaseAuth: getIt<FirebaseAuth>(),
  ));
}