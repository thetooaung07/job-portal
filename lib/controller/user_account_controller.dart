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

  // Edit Profile Page Controller
  TextEditingController usernameC = new TextEditingController();
  TextEditingController emailC = new TextEditingController();

  @override
  void onInit() {
    super.onInit();
    if (firebaseAuth.currentUser != null) {
      _userAccount.bindStream(
          FirestoreHelper().userAccountStream(firebaseAuth.currentUser!.uid));
    }
    // //For Edit profile page
    // if (user.username != null && user.email != null) {
    //   print("Inside on inti not null");
    //   usernameC.text = user.username!;
    //   emailC.text = user.email!;
    // }
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
    final String fileLink =
        await storageService.uploadPhoto(_file, 'profile/${userId}');

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
          print(element["id"]);
          docListWithProfileNull.add(element["id"]);
        } else
          return;
      });
    });

    for (var docPath in docListWithProfileNull) {
      print(docPath);
      await FirestoreHelper().update(
          collectionPath: "jobPosts",
          docPath: docPath,
          data: {"postedBy.profile": fileLink});
    }
  }

  bool shouldUpdateCheck() {
    if (usernameC.text == user.username &&
        emailC.text == user.email &&
        usernameC.text == firebaseAuth.currentUser?.email)
      return false;
    else if (usernameC.text.trim().length < 0 && emailC.text.trim().length < 0)
      return false;
    else
      return true;
  }

  // Edit Profile Update // only username and email

  void usernameAndEmailUpdate() async {
    if (!shouldUpdateCheck())
      return;
    else {
      // Update Firebase Authentication
      late UserCredential newCre;

      if (user.email != null && user.password != null) {
        newCre = await firebaseAuth.signInWithEmailAndPassword(
          email: user.email!,
          password: user.password!,
        );
        if (newCre.user != null) {
          await newCre.user?.updateEmail(emailC.text.trim());
        }
      }

      UserAccount _user = new UserAccount(
          username: usernameC.text,
          email: emailC.text,
          addABio: user.addABio,
          cvFile: user.cvFile,
          password: user.password,
          profile: user.profile,
          profileDetails: user.profileDetails,
          userId: user.userId);
// Update CloudFirestore
      await FirestoreHelper().update(
        collectionPath: "users",
        docPath: user.userId,
        data: _user.toJson(),
      );
    }

    Fluttertoast.showToast(
        msg: "Success",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
