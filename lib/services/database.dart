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

  //Create User
  Future<bool> createNewUser(UserAccount user) async {
    print(user.username);
    print(user.userId);
    print(user.email);
    try {
      await firebaseFirestore.collection("users").doc(user.userId).set({
        "username": user.username,
        "email": user.email,
        "password": user.password,
      });
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
