import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/model/job_post_model.dart';
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
      firebaseFirestore
          .collection(collectionPath)
          .orderBy("createdAt", descending: true)
          .get();

// Stream
  Stream<DocumentSnapshot<Map<String, dynamic>>> watchByDoc(
          String collectionPath, String? docPath) =>
      firebaseFirestore.collection(collectionPath).doc(docPath).snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> watchAll(String collectionPath) =>
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
  Future update({
    required String collectionPath,
    required Map<String, dynamic> data,
    String? docPath,
  }) async {
    try {
      await firebaseFirestore
          .collection(collectionPath)
          .doc(docPath)
          .update(data);
    } catch (e) {
      log(e.toString());
    }
  }

  // add more or merge into Existing Data
  Future<void> mergeData({
    required String collectionPath,
    required Map<String, dynamic> data,
    String? docPath,
  }) =>
      firebaseFirestore
          .collection(collectionPath)
          .doc(docPath)
          .set(data, SetOptions(merge: true));

//delete
  Future<void> delete({
    required String collectionPath,
    required String path,
  }) =>
      firebaseFirestore.collection(collectionPath).doc(path).delete();

  //Create User + initialized profile_stats for this user.
  Future<bool> createNewUser(UserAccount user) async {
    try {
      await firebaseFirestore
          .collection("users")
          .doc(user.userId)
          .set(user.toJson());
      return true;
    } catch (e) {
      log(e.toString());
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
      log(e.toString());
      rethrow;
    }
  }

  Stream<List<JobPostModel>> jobPostsStream() {
    return firebaseFirestore
        .collection("jobPosts")
        .orderBy("createdAt", descending: true)
        .snapshots()
        .map((event) {
      List<JobPostModel> dataList = [];
      for (var element in event.docs) {
        dataList.add(JobPostModel.fromDocumentSnapshot(element));
      }

      return dataList;
    });
  }

  Stream<List<JobPostModel>> jobPostsByOneUser({String? userId}) {
    return firebaseFirestore
        .collection("jobPosts")
        .where("postedBy.userId", isEqualTo: firebaseAuth.currentUser!.uid)
        .snapshots()
        .map((event) {
      List<JobPostModel> dataList = [];
      for (var element in event.docs) {
        dataList.add(JobPostModel.fromDocumentSnapshot(element));
      }
      return dataList;
    });
  }

  // Stream<List<JobPostModel>> allJobPostsStream() {
  //   return firebaseFirestore
  //       .collection("jobPosts")
  //       .orderBy("createdAt", descending: true)
  //       .snapshots()
  //       .map((event) {
  //     List<JobPostModel> dataList = [];
  //     event.docs.forEach((element) {
  //       dataList.add(JobPostModel.fromDocumentSnapshot(element));
  //     });

  //     return dataList;
  //   });
  // }

  Stream<UserAccount> userAccountStream(String userId) {
    return firebaseFirestore
        .collection("users")
        .doc(userId)
        .snapshots()
        .map((event) => UserAccount.fromDocumentSnapshot(event));
  }
}
