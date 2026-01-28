import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo{

  Future<void> login({
    required String email,
    required String password,
  });

  Future<void> register({
    required User user,
    required String password
  });
  Future<void> logout();
}