import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/services/database.dart';
import 'dart:async';
import 'dart:io';

class UserAccountController extends GetxController {
  Rx<UserAccount> _userAccount = UserAccount().obs;
  UserAccount get user => _userAccount.value;

  set user(UserAccount value) => this._userAccount.value = value;

  void clear() {
    _userAccount.value = UserAccount();
  }

  @override
  void onInit() {
    super.onInit();
    if (firebaseAuth.currentUser != null) {
      _userAccount.bindStream(
          FirestoreHelper().userAccountStream(firebaseAuth.currentUser!.uid));
    }
  }

  int calculate(Map profileStats) {
    int count = 0;
    profileStats.forEach((key, value) {
      if (value == true) count++;
      return;
    });
    return count;
  }

// TODO try taking with stream
  Future updateProfileStats(
    String collectionPath,
    String docPath,
    Map<String, dynamic> data,
  ) async {
    // update partially
    await FirestoreHelper()
        .update(collectionPath: collectionPath, docPath: docPath, data: data);
  }

  RxBool isUploading = false.obs;

  Future<void> uploadProfile() async {
    String? userId = firebaseAuth.currentUser?.uid;
    if (userId == null) return;
    if (isUploading.value) return;
    final XFile? _file =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (_file == null) return;
    isUploading.value = true;
    final String fileLink = await storageService.uploadToFirebaseStorage(
        _file, 'profile/${userId}');

    await FirestoreHelper().update(
      collectionPath: "users",
      docPath: userId,
      data: {"profile": fileLink},
    );

    isUploading.value = false;

    update();
// Update Profile Link for null
    List docListWithProfileNull = [];
    await firebaseFirestore
        .collection("jobPosts")
        .where("postUserId", isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element["postedBy"]["profile"] == null) {
          docListWithProfileNull.add(element["id"]);
        } else
          return;
      });
    });

    for (var docPath in docListWithProfileNull) {
      await FirestoreHelper().update(
          collectionPath: "jobPosts",
          docPath: docPath,
          data: {"postedBy.profile": fileLink});
    }
  }
}
