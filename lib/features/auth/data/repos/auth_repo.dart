
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo{

  Future<void> login({
    required String email,
    required String password,
  });

  Future<void> register({
    required String email,
    required String password
  });
  Future<void> logout();
  Future<void> loginOrRegisterWithGoogle();
  bool isLoggedIn();
  Future<void> forgotPassword({required String email});
  User? getCurrentUser();
}