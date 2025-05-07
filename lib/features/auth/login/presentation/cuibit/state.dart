import 'package:familybudgetmanager/features/auth/login/domain/entity/user.dart';

class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final UserEntity? user;
  const LoginSuccess({required this.user});
}

class LoginError extends LoginState {
  final String error;
  const LoginError(this.error);
}
