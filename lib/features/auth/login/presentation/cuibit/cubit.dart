import 'package:familybudgetmanager/features/auth/login/domain/usecases/biometric_login_usecase.dart';
import 'package:familybudgetmanager/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:familybudgetmanager/features/auth/login/presentation/cuibit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUseCase;
  final BiometricLoginUsecase biometricUseCase;
  LoginCubit({required this.loginUseCase, required this.biometricUseCase})
    : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      final user = await loginUseCase(email, password);

      final prefs = await SharedPreferences.getInstance();
      final loggedInBefore = prefs.getBool('logged_in_before') ?? false;

      if (!loggedInBefore) {
        final isBiometricOk = await biometricUseCase();
        if (isBiometricOk) {
          await prefs.setBool('logged_in_before', true);
          emit(LoginSuccess(user: user));
        } else {
          emit(const LoginError("filed biometric verification"));
        }
      } else {
        emit(LoginSuccess(user: user));
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  Future<void> loginWithBiometricOnly() async {
    try {
      final isOk = await biometricUseCase();
      if (isOk) {
        emit(LoginSuccess(user: null)); // Empty string instead of null
      } else {
        emit(const LoginError("filed biometric verification"));
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
