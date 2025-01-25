// user_model.dart
class UserModel {
  final String uid;
  final String email;
  final String name;
  final String photoUrl;
  final DateTime createdAt;

  UserModel({required this.name, required this.photoUrl, required this.uid, required this.email,required this.createdAt});
}
