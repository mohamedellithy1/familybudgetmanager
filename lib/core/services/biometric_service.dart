import 'package:local_auth/local_auth.dart';

// biometric_service.dart
abstract class BiometricService {
  Future<bool> authenticateWithBiometrics();
}

class BiometricServiceImpl implements BiometricService {
  final LocalAuthentication auth;

  BiometricServiceImpl({required this.auth});

  @override
  Future<bool> authenticateWithBiometrics() async {
    return await auth.authenticate(
      localizedReason: 'operate the app with your FaceID or Fingerprint',
      options: const AuthenticationOptions(
        biometricOnly: true,
        stickyAuth: true,
      ),
    );
  }
}
