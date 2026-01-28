import 'package:e_commerce_app/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImple implements AuthRepo {
  final FirebaseAuth firebaseAuth;
  User? user;
  AuthRepoImple({required this.firebaseAuth});
  @override
  User? getUserData() {
    return user;
  }

  @override
  bool isLoggedIn() {
    return user != null;
  }

  @override
  Future<void> login({required String email, required String password}) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
    user = null;
  }

  @override
  Future<void> register({required User user, required String password}) async {
    firebaseAuth.createUserWithEmailAndPassword(
      email: user.email!,
      password: password,
    );
    this.user = user;
  }

  @override
  Future<void> googleLogin() async {
    UserCredential userCredential = await firebaseAuth.signInWithPopup(
      GoogleAuthProvider(),
    );
    user = userCredential.user;
  }
}
