import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
// Read
  Future<DocumentSnapshot<Map<String, dynamic>>> readByDoc({
    required String collectionPath,
    String? docPath,
  }) =>
      _firebase.collection(collectionPath).doc(docPath).get();

  Future<QuerySnapshot<Map<String, dynamic>>> readByCollection({
    required String collectionPath,
  }) =>
      _firebase.collection(collectionPath).get();

// create
  Future<void> create({
    required String collectionPath,
    required Map<String, dynamic> data,
    String? docPath,
  }) =>
      _firebase.collection(collectionPath).doc(docPath).set(data);

//update
  Future<void> update({
    required String collectionPath,
    required Map<String, dynamic> data,
    String? docPath,
  }) =>
      _firebase.collection(collectionPath).doc(docPath).update(data);

//delete
  Future<void> delete({
    required String collectionPath,
    required String path,
  }) =>
      _firebase.collection(collectionPath).doc(path).delete();
}
