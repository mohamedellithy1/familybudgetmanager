import 'package:familybudgetmanager/features/auth/login/domain/repositories/auth_repository.dart';

class BiometricLoginUsecase {
  final AuthRepository _authRepository;
  BiometricLoginUsecase({required AuthRepository authRepository})
    : _authRepository = authRepository;
  Future<bool> call() async {
    return await _authRepository.loginWithBiometric();
  }
}
