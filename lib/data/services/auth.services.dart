import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../view/widgets/common/feedback_snackbar.dart';
import '../models/user/user.model.dart';

class AuthService {
  //firebase auth instance
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignInAuth = GoogleSignIn();

  // Create user object based on Firebase User
  UserModel? _userFromFirebaseUser(User? user) {
    return user != null
        ? UserModel(
            uid: user.uid,
            email: user.email ?? "",
            createdAt: user.metadata.creationTime ?? DateTime.now(),
            photoUrl: user.photoURL ?? "",
            name: user.displayName ?? "",
          )
        : null;
  }

  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignInAuth.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      return _userFromFirebaseUser(userCredential.user);
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

  Future<void> signOut() async {
    await googleSignInAuth.signOut();
    await firebaseAuth.signOut();
  }
}
