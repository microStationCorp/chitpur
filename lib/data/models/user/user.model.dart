enum UserRole {
  admin('admin'),
  dev('dev'),
  user('user');

  final String value;

  const UserRole(this.value);

  static UserRole fromString(String roleString) {
    return UserRole.values.firstWhere(
      (role) => role.value == roleString,
      orElse: () => UserRole.user, // Default to user if not found
    );
  }

  @override
  String toString() => value;
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
        role: UserRole.fromString(json['role']),
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

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? photoUrl,
    DateTime? createdAt,
    UserRole? role,
    int? phoneNumber,
    String? designation,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
      role: role ?? this.role,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      designation: designation ?? this.designation,
    );
  }
}
