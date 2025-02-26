enum UserRole {
  admin,
  dev,
  user;
}

// user_model.dart
class UserModel {
  final String uid;
  final String email;
  final String name;
  final String photoUrl;
  final int? phoneNumber;
  final String? designation;
  final DateTime createdAt;
  final UserRole role;

  UserModel({
    this.phoneNumber,
    this.designation,
    required this.name,
    required this.photoUrl,
    required this.uid,
    required this.email,
    required this.createdAt,
    this.role = UserRole.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        email: json['email'],
        name: json['name'],
        photoUrl: json['photoUrl'],
        phoneNumber: json['phoneNumber'],
        designation: json['designation'],
        role: UserRole.values.firstWhere(
          (element) => element.toString() == json['role'],
        ),
        createdAt: DateTime.parse(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'name': name,
        'photoUrl': photoUrl,
        'phoneNumber': phoneNumber,
        'designation': designation,
        'createdAt': createdAt.toIso8601String(),
        'role': role.toString(),
      };

  UserModel copyWith(
      {String? uid,
      String? email,
      String? name,
      String? photoUrl,
      DateTime? createdAt,
      UserRole? role,
      int? phoneNumber,
      String? designation}) {
    return UserModel(
      phoneNumber: phoneNumber,
      name: name!,
      photoUrl: photoUrl!,
      uid: uid!,
      email: email!,
      createdAt: createdAt!,
      designation: designation!,
      role: role!,
    );
  }
}
