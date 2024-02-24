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
    final doc = store.collection('users').doc(
          model.id,
        );
    await doc.set(
      model.toJson(),
    );
  }

  Stream<List<UserDataModel>> getUserData(String id) {
    final result = store.collection('users').snapshots().map(
          (collection) => collection.docs.where((doc) => doc.id == id).map(
            (doc) {
              return UserDataModel.fromJson(
                doc.data(),
              );
            },
          ).toList(),
        );
    return result;
  }

  // Stream<List<UserDataModel>> getUserData(String id) {
  //   final resutl = store.collection('users').snapshots().map(
  //         (colletion) => colletion.docs.map(
  //           (doc) {
  //             if (doc.id == id) {
  //               return UserDataModel.fromJson(
  //                 doc.data(),
  //               );
  //             } else {
  //               return UserDataModel();
  //             }
  //           },
  //         ).toList(),
  //       );
  //   return resutl;
  // }
}
