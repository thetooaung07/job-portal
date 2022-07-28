import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/user_account_controller.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/routes/routes.dart';
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

  Future<void> updateUsernameinFirestore() async {
    // UserAccount _user = new UserAccount(
    //   username: usernameC.text,
    //   email: emailC.text,
    //   addABio: user.addABio,
    //   cvFile: user.cvFile,
    //   password: user.password,
    //   profile: user.profile,
    //   profileDetails: user.profileDetails,
    //   userId: user.userId,
    // );
    // Update CloudFirestore
    await FirestoreHelper().update(
      collectionPath: "users",
      docPath: user.userId,
      data: {"username": usernameC.text.trim(), "email": emailC.text.trim()},
    );

    // Update Profile Link for null
    List unUpdatedUsernameDocList = [];
    await firebaseFirestore
        .collection("jobPosts")
        .where("postUserId", isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element["postedBy"]["username"] != usernameC.text) {
          unUpdatedUsernameDocList.add(element["id"]);
        } else
          return;
      });
    });

    for (var docPath in unUpdatedUsernameDocList) {
      FirestoreHelper().update(
          collectionPath: "jobPosts",
          docPath: docPath,
          data: {"postedBy.username": usernameC.text});
    }
  }

  // Edit Profile Update // only username and email

  void usernameAndEmailUpdate() async {
    if (!shouldUpdateCheck())
      return;
    else {
      // Update Firebase Authentication
      if (user.email != null && user.password != null) {
        if (user.email != emailC.text.trim()) {
          Future.wait([
            updateUsernameinFirestore(),
            firebaseAuth
                .signInWithEmailAndPassword(
                  email: user.email!,
                  password: user.password!,
                )
                .then((newCre) => newCre.user?.updateEmail(emailC.text.trim())),
          ]);
        } else {
          await updateUsernameinFirestore();
          Get.toNamed(RouteNames.home);
        }
        await Fluttertoast.showToast(
          msg: "Success",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }
}
