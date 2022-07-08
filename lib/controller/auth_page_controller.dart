import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:job_portal/model/user_details.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/services/database.dart';

class LoginPageController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final FocusNode passFocusNode = FocusNode();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  RxBool isObscure = true.obs;

  void togglePasswordEye() {
    isObscure.value = !isObscure.value;
  }

  Future goLogin() async {
    print("Inside Gologin");
    try {
      //authenticate user
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text, password: passController.text);

      Fluttertoast.showToast(
          msg: "Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      // print("Error => $e");
    }

    Get.offNamedUntil(RouteNames.home, (route) => false);
  }
}

class SignUpController extends GetxController {
  // late UserAccount userAccount;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cPassController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();
  final FocusNode cPassFocusNode = FocusNode();

  RxBool isObscure = true.obs;

  void togglePasswordEye() {
    isObscure.value = !isObscure.value;
  }

  GlobalKey<FormState>? signUpForm = GlobalKey();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> goSignUp() async {
    // TODO: to add validate
    // validate ? add User : show error.
    // if (signUpForm?.currentState?.validate() != true) return;
    cPassFocusNode.unfocus();
    try {
      //authenticate user
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text, password: passController.text);
      //store user details in cfirestore

      final FirebaseAuth auth = FirebaseAuth.instance;
      String? userID = await auth.currentUser?.uid;

      await addUserDetails(UserDetails(
          userId: userID,
          username: usernameController.text,
          email: emailController.text,
          password: passController.text));

      Fluttertoast.showToast(
          msg: "Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      // print("Error => $e");
    }

    Get.offNamedUntil(RouteNames.home, (route) => false);
  }

  Future addUserDetails(UserDetails user) async {
    print("Inside addUserDetails");
    await FirebaseHelper().create(
        collectionPath: "users",
        docPath: "${user.username}-${user.userId}",
        data: {
          "username": user.username,
          "email": user.email,
          "password": user.password,
        });
  }
}
