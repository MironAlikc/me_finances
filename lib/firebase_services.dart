import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:me_finances/data/models/user_data_model.dart';

class FirebaseServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore store = FirebaseFirestore.instance;

  Future<UserCredential> createAccout({
    required String email,
    required String password,
  }) async {
    final result = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result;
  }

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    final result = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result;
  }

  Future<void> resetPassword({required String email}) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Future<void> createUserData({
    required UserDataModel model,
  }) async {
    final doc = store.collection('users').doc(model.id);
    await doc.set(
      model.toJson(),
    );
  }
}
