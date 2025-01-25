import 'package:chitpur/data/models/microprocessor/microprocessor.model.dart';
import 'package:chitpur/resource/app_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MicroprocessorDatabaseService {
  // Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Reference to the microprocessor collection with type conversion
  late final CollectionReference<Microprocessor> _microprocessorRef;

  // Constructor to initialize the collection reference with converter
  MicroprocessorDatabaseService() {
    _microprocessorRef = firestore
        .collection(FirestoreCollectionName.microprocessorCollectionName)
        .withConverter<Microprocessor>(
            fromFirestore: (snapshots, _) =>
                Microprocessor.fromJson(snapshots.data()!),
            toFirestore: (microprocessor, _) => microprocessor.toJson());
  }

  // Stream of snapshots to get all microprocessors
  Stream<QuerySnapshot<Microprocessor>> getAllMicroprocessors() {
    return _microprocessorRef.snapshots();
  }

  // Method to add a new microprocessor document to the collection
  void addMicroprocessor(Microprocessor microprocessor) async {
    await _microprocessorRef.add(microprocessor);
  }

  // Method to get a microprocessor document by its ID
  Future<DocumentSnapshot<Microprocessor>> getMicroprocessorById(
      String id) async {
    return await _microprocessorRef.doc(id).get();
  }

  // must check next time
  Stream<QuerySnapshot<Object?>> queryOrOperation(
      List<Map<String, List<String>>> queryData) {
    if (queryData.isEmpty) {
      return Stream.empty();
    }

    Query query = _microprocessorRef;

    for (Map<String, List<String>> data in queryData) {
      String field = data.keys.first; // Getting the field name
      List<String> values = data.values.first; // Getting the list of values

      query = query.where(field, whereIn: values);
    }

    return query.snapshots();
  }
}
