import 'package:chitpur/view/widgets/common/feedback_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/user/user.model.dart';

class AuthService {
  //firebase auth instance
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Create user object based on Firebase User
  UserModel? _userFromFirebaseUser(User? user) {
    return user != null
        ? UserModel(
            uid: user.uid,
            email: user.email??"",
            createdAt: user.metadata.creationTime ?? DateTime.now(),
            photoUrl: user.photoURL??"",
            name: user.displayName??"",)
        : null;
  }

  //create user
  Future<UserModel?> signUp(
      {required String email, required String password}) async {
    try {
      UserCredential result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = "Something wrong";
      }

      errorSnackBar("Auth Error", message);
      return null;
    }
  }

  //signin user
  Future<UserModel?> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      User? firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-credential') {
        message = 'auth credential is incorrect';
      } else {
        message = "Something wrong";
      }
      if (kDebugMode) {
        print("credential : ${e.credential}, message: ${e.message}");
      }

      errorSnackBar("Auth Error", message);
      return null;
    }
  }

  //sign out
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
