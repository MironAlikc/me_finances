part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  UserCredential userCredential;
  LoginSuccess({required this.userCredential});
}

final class LoginError extends LoginState {
  final String errorText;
  LoginError({required this.errorText});
}

final class LoginLoading extends LoginState {}
