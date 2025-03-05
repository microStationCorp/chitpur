import 'package:chitpur/data/models/user/user.model.dart';
import 'package:chitpur/resource/app_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late final CollectionReference<UserModel> _userRef;

  UserServices() {
    _userRef = firestore
        .collection(FirestoreCollectionName.userCollectionName)
        .withConverter<UserModel>(
            fromFirestore: (snapshots, _) =>
                UserModel.fromJson(snapshots.data()!),
            toFirestore: (user, _) => user.toJson());
  }

  // Method to get a user document by its ID
  Future<DocumentSnapshot<UserModel>> getUserById(String uid) async {
    return await _userRef.doc(uid).get();
  }

  // Method to add a new user document to the collection
  void addUser(UserModel user) async {
    await _userRef.doc(user.uid).set(user);
  }
}
