import 'package:chitpur/data/services/auth.services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/route_name.dart';
import '../../models/user/user.model.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  final AuthService authService = AuthService();
  var user = UserModel(
    uid: '',
    email: '',
    name: '',
    photoUrl: '',
    createdAt: DateTime.now(),
  ).obs;

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

  Future<void> signIn() async {
    isLoading.value = true;
    UserModel? result = await authService.signInWithGoogle();
    if (result != null) {
      user.value = result;
      isLoading.value = false;
      Get.offAllNamed(RouteNames.homeScreen);
    }
    isLoading.value = false;
  }

  Future<void> signOut() async {
    await authService.signOut();
    user.value = nullUser;
    Get.offAllNamed(RouteNames.authScreen);
  }

  bool get isSignedIn => user.value.uid.isNotEmpty;

  UserModel get nullUser => UserModel(
      uid: '', email: '', name: '', photoUrl: '', createdAt: DateTime.now());
}
