import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/auth/data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
  bool isLoggedIn() => authRepo.isLoggedIn();
  Future<void> loginOrRegisterWithGoogle() async {
    emit(AuthLoading());
    try {
      await authRepo.loginOrRegisterWithGoogle();
      emit(AuthSuccess());
    } on Exception catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> signin({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await authRepo.login(email: email, password: password);
      emit(AuthSuccess());
    } on Exception catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      await authRepo.register(email: email, password: password);
      emit(AuthSuccess());
    } on Exception catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> forgotPassword({required String email}) async {
    emit(AuthLoading());
    try {
      await authRepo.forgotPassword(email: email);
      emit(AuthSuccess());
    } on Exception catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
