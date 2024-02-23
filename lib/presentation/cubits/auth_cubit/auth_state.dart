part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  UserCredential userCredential;
  AuthSuccess({required this.userCredential});
}

final class AuthError extends AuthState {
  final String errorText;
  AuthError({required this.errorText});
}

final class AuthLoading extends AuthState {}
