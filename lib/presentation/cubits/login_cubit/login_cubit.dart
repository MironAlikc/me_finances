import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_finances/firebase_services.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repositiry}) : super(LoginInitial());
  final FirebaseServices repositiry;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final resutl = await repositiry.login(
        email: email,
        password: password,
      );
      emit(
        LoginSuccess(userCredential: resutl),
      );
    } catch (e) {
      print(e.runtimeType);
      if (e is FirebaseAuthException) {
        emit(
          LoginError(
            errorText: e.message ?? '',
          ),
        );
      } else {
        emit(
          LoginError(
            errorText: e.toString(),
          ),
        );
      }
    }
  }
}
