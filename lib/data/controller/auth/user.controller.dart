import 'package:get/get.dart';

import '../../models/user/user.model.dart';
import '../../services/user.services.dart';

class UserController extends GetxController {
  final UserServices _userServices = UserServices();
  var user = UserModel(
    uid: '',
    email: '',
    name: '',
    photoUrl: '',
    createdAt: DateTime.now(),
  ).obs;

  UserModel get nullUser => UserModel(
        uid: '',
        email: '',
        name: '',
        photoUrl: '',
        createdAt: DateTime.now(),
      );

  void addUser() {
    try {
      _userServices.addUser(user.value);
    } catch (e) {
      throw Exception(["Something wrong when save userdata"]);
    }
  }
}
