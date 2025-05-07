import 'package:familybudgetmanager/features/auth/login/domain/entity/user.dart';

abstract class AuthRepository {
  Future<UserEntity> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<bool> loginWithBiometric();
  
}
