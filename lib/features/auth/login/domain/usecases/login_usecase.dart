import 'package:familybudgetmanager/features/auth/login/domain/entity/user.dart';
import 'package:familybudgetmanager/features/auth/login/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;
  LoginUsecase({required this.authRepository});
  Future<UserEntity> call(String email, String password) async {
    return await authRepository.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}