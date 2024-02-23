import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_finances/firebase_services.dart';

part 'resset_password_state.dart';

// class RessetPasswordCubit extends Cubit<RessetPasswordState> {
//   RessetPasswordCubit() : super(RessetPasswordInitial());
// }

class RessetPasswordCubit extends Cubit<RessetPasswordState> {
  RessetPasswordCubit({required this.repositiry})
      : super(RessetPasswordInitial());
  final FirebaseServices repositiry;

  Future<void> ressetPasswod({required String email}) async {
    emit(RessetPasswordLoading());
    try {
      repositiry.resetPassword(email: email);
      emit(RessetPasswordSuccess());
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(
          RessetPasswordError(
            errorText: e.message ?? '',
          ),
        );
      } else {
        emit(
          RessetPasswordError(
            errorText: e.toString(),
          ),
        );
      }
    }
  }
}
