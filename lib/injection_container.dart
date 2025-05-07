import 'package:familybudgetmanager/core/services/biometric_service.dart';
import 'package:familybudgetmanager/features/auth/login/data/datasources/auth_remote_datasource.dart';
import 'package:familybudgetmanager/features/auth/login/data/repositories/auth_repository_impl.dart';
import 'package:familybudgetmanager/features/auth/login/domain/repositories/auth_repository.dart';
import 'package:familybudgetmanager/features/auth/login/domain/usecases/biometric_login_usecase.dart';
import 'package:familybudgetmanager/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:familybudgetmanager/features/auth/login/presentation/cuibit/cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

class InjectionContainer {
  Future<void> init() async {
    // External
    final sharedPrefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPrefs);
    sl.registerLazySingleton(() => Supabase.instance.client);

    // Services
    sl.registerLazySingleton<BiometricService>(
      () => BiometricServiceImpl(auth: LocalAuthentication()),
    ); // ← أضف هذا

    // Data sources
    sl.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(supabaseClient: sl()),
    );

    // Repository
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        authRemoteDatasource: sl(),
        biometricService: sl(),
      ),
    );

    // Use Cases
    sl.registerLazySingleton(() => LoginUsecase(authRepository: sl()));
    sl.registerLazySingleton(() => BiometricLoginUsecase(authRepository: sl()));

    // Cubit
    sl.registerFactory(
      () => LoginCubit(biometricUseCase: sl(), loginUseCase: sl()),
    );
  }
}
