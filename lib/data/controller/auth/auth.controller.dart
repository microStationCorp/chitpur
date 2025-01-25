import 'package:chitpur/data/services/auth.services.dart';
import 'package:chitpur/routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../models/user/user.model.dart';

class AuthController extends GetxController {
  final AuthService authService = AuthService();
  var user = UserModel(
          uid: '', email: '', name: '', photoUrl: '', createdAt: DateTime.now())
      .obs;

  late String email;
  late String password;

  @override
  void onInit() {
    super.onInit();
    authService.firebaseAuth.authStateChanges().listen(
      (User? firebaseUser) {
        if (firebaseUser != null) {
          user.value = UserModel(
            uid: firebaseUser.uid,
            email: firebaseUser.email!,
            name: firebaseUser.displayName ?? "",
            photoUrl: firebaseUser.photoURL ?? "",
            createdAt: firebaseUser.metadata.creationTime ?? DateTime.now(),
          );
        } else {
          user.value = nullUser;
        }
      },
    );
  }

  Future<void> signUp() async {
    UserModel? result =
        await authService.signUp(email: email, password: password);
    if (result != null) {
      user.value = result;
    }
  }

  Future<void> signIn() async {
    UserModel? result =
        await authService.signIn(email: email, password: password);
    if (result != null) {
      user.value = result;
      Get.offAllNamed(RouteNames.homeScreen);
    }
  }

  Future<void> signOut() async {
    await authService.signOut();
    user.value = nullUser;
  }

  bool get isSignedIn => user.value.uid.isNotEmpty;

  UserModel get nullUser => UserModel(
      uid: '', email: '', name: '', photoUrl: '', createdAt: DateTime.now());
}
