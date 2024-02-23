part of 'resset_password_cubit.dart';

@immutable
sealed class RessetPasswordState {}

final class RessetPasswordInitial extends RessetPasswordState {}

final class RessetPasswordError extends RessetPasswordState {
  final String errorText;
  RessetPasswordError({required this.errorText});
}

final class RessetPasswordSuccess extends RessetPasswordState {}

final class RessetPasswordLoading extends RessetPasswordState {}
