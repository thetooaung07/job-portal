import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/model/user_account.dart';

class FirestoreHelper {
// Read
  Future<DocumentSnapshot<Map<String, dynamic>>> readByDoc({
    required String collectionPath,
    String? docPath,
  }) =>
      firebaseFirestore.collection(collectionPath).doc(docPath).get();

  Future<QuerySnapshot<Map<String, dynamic>>> readByCollection({
    required String collectionPath,
  }) =>
      firebaseFirestore.collection(collectionPath).get();

// Watch
  Stream<DocumentSnapshot<Map<String, dynamic>>> watchByDoc(
          String collectionPath, String? docPath) =>
      firebaseFirestore.collection(collectionPath).doc(docPath).snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> watchCollection(
          String collectionPath) =>
      firebaseFirestore.collection(collectionPath).snapshots();

// Watch

// create
  Future<void> create({
    required String collectionPath,
    required Map<String, dynamic> data,
    String? docPath,
  }) =>
      firebaseFirestore.collection(collectionPath).doc(docPath).set(data);

//update
  Future<void> update({
    required String collectionPath,
    required Map<String, dynamic> data,
    String? docPath,
  }) =>
      firebaseFirestore.collection(collectionPath).doc(docPath).update(data);

//delete
  Future<void> delete({
    required String collectionPath,
    required String path,
  }) =>
      firebaseFirestore.collection(collectionPath).doc(path).delete();

  //Create User + initialized profile_stats for this user.
  Future<bool> createNewUser(UserAccount user) async {
    try {
      await firebaseFirestore.collection("users").doc(user.userId).set({
        "username": user.username,
        "email": user.email,
        "password": user.password,
      }).then((value) =>
          firebaseFirestore.collection("profile_stats").doc(user.userId).set({
            "cv_file": false,
            "profile_details": false,
          }));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Retrieve a User
  Future<UserAccount> getUser(String userId) async {
    try {
      DocumentSnapshot doc =
          await firebaseFirestore.collection("users").doc(userId).get();
      return UserAccount.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
