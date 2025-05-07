import 'package:familybudgetmanager/features/auth/login/domain/entity/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDatasource {
  Future<UserEntity> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final SupabaseClient supabaseClient;
  AuthRemoteDatasourceImpl({required this.supabaseClient});
  @override
  Future<UserEntity> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final user = response.user;
    if (user == null) {
      throw Exception('User not found');
    }
    return UserEntity(
      id: user.id,
      email: user.email ?? '',
      phone: user.phone ?? '',
      name: user.userMetadata!['username'] ?? '',
    );
  }
}
