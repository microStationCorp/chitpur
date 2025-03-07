import 'package:chitpur/data/controller/auth/user.controller.dart';
import 'package:chitpur/data/services/auth.services.dart';
import 'package:chitpur/data/services/user.services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/route_name.dart';
import '../../models/user/user.model.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final _authService = AuthService();
  final _userController = Get.find<UserController>();
  final _userServices = UserServices();

  // Initialize the authentication state listener.
  @override
  void onInit() {
    super.onInit();
    // Listen for changes in the authentication state.
    _authService.firebaseAuth.authStateChanges().listen(_handleAuthState);
  }

  // Handle changes in the authentication state.
  Future<void> _handleAuthState(User? firebaseUser) async {
    if (firebaseUser == null) {
      _userController.user.value = _userController.nullUser;
      return;
    }
    DocumentSnapshot<UserModel> snapshot =
        await _userServices.getUserById(firebaseUser.uid);
    _userController.user.value =
        snapshot.exists ? snapshot.data()! : await _createNewUser(firebaseUser);
  }

  // Create a new user in the database.
  Future<UserModel> _createNewUser(User firebaseUser) async {
    final newUser = UserModel(
      uid: firebaseUser.uid,
      email: firebaseUser.email ?? "",
      name: firebaseUser.displayName ?? "",
      photoUrl: firebaseUser.photoURL ?? "",
      createdAt: firebaseUser.metadata.creationTime ?? DateTime.now(),
    );
    _userController.addUser();
    return newUser;
  }

  // Sign in the user with Google.
  Future<void> signIn() async {
    isLoading.value = true;
    final result = await _authService.signInWithGoogle();
    if (result != null) {
      _userController.user.value = result;
      Get.offAllNamed(RouteNames.homeScreen);
    }
    isLoading.value = false;
  }

  // Sign out the user.
  Future<void> signOut() async {
    await _authService.signOut();
    _userController.user.value = _userController.nullUser;
    Get.offAllNamed(RouteNames.authScreen);
  }

  bool get isSignedIn => _userController.user.value.uid.isNotEmpty;
}
