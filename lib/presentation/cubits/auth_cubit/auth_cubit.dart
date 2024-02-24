import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_finances/data/models/user_data_model.dart';
import 'package:me_finances/firebase_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.repositiry}) : super(AuthInitial());
  final FirebaseServices repositiry;

  Future<void> createAccount({
    required String email,
    required String password,
    required UserDataModel model,
  }) async {
    emit(AuthLoading());

    try {
      final resutl = await repositiry.createAccout(
        email: email,
        password: password,
      );
      model.id = resutl.user?.uid ?? '';
      await repositiry.createUserData(model: model);
      emit(
        AuthSuccess(userCredential: resutl),
      );
    } catch (e) {
      print(e.runtimeType);
      if (e is FirebaseAuthException) {
        emit(
          AuthError(
            errorText: e.message ?? '',
          ),
        );
      } else {
        emit(
          AuthError(
            errorText: e.toString(),
          ),
        );
      }
    }
  }
}
