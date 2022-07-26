import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/user_account_controller.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/services/database.dart';

class UserInfoUpdateController extends GetxController {
  // Edit Profile Page Controller

  UserAccount user = Get.find<UserAccountController>().user;

  TextEditingController usernameC = new TextEditingController();
  TextEditingController emailC = new TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (user.username != null && user.email != null) {
      usernameC.text = user.username!;
      emailC.text = user.email!;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    usernameC..dispose();
    emailC.dispose();
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
        userId: user.userId,
      );
// Update CloudFirestore
      await FirestoreHelper().update(
        collectionPath: "users",
        docPath: user.userId,
        data: _user.toJson(),
      );
    }

    // Update Profile Link for null
    List unUpdatedDocList = [];
    await firebaseFirestore
        .collection("jobPosts")
        .where("postUserId", isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element["postedBy"]["username"] != usernameC.text) {
          unUpdatedDocList.add(element["id"]);
        } else
          return;
      });
    });

    for (var docPath in unUpdatedDocList) {
      await FirestoreHelper().update(
          collectionPath: "jobPosts",
          docPath: docPath,
          data: {"postedBy.username": usernameC.text});
    }

    Fluttertoast.showToast(
      msg: "Success",
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
