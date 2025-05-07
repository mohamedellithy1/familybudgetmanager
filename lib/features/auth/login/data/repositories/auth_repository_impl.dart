import 'package:familybudgetmanager/core/services/biometric_service.dart';
import 'package:familybudgetmanager/features/auth/login/data/datasources/auth_remote_datasource.dart';
import 'package:familybudgetmanager/features/auth/login/domain/entity/user.dart';
import 'package:familybudgetmanager/features/auth/login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  final BiometricService biometricService;

  AuthRepositoryImpl({
    required this.authRemoteDatasource,
    required this.biometricService,
  });
  @override
  Future<bool> loginWithBiometric() async {
    return await biometricService.authenticateWithBiometrics();
  }

  @override
  Future<UserEntity> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return authRemoteDatasource.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
