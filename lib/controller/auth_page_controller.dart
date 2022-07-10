import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/user_account_controller.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/services/database.dart';
import 'package:job_portal/view/login/login_page.dart';

class AuthController extends GetxController {
  // AuthController Instance;
  static AuthController instance = Get.find();

  // void setloginUser(UserAccount userModel) {
  //   _loginUser.value = userModel;
  // }

  // User? get loginUser => _loginUser.value.user;

  // String? get email => _loginUser.value.email;
  // String? get password => _loginUser.value.password;

// email , pass, username;
  late Rx<User?> _user;

  @override
  void onReady() async {
    super.onReady();

    _user = Rx<User?>(firebaseAuth.currentUser);

    if (firebaseAuth.currentUser != null) {
      print("object => user is not null, assigning value to user");
      Get.find<UserAccountController>().user =
          await FirestoreHelper().getUser(firebaseAuth.currentUser!.uid);
    }

    _user.bindStream(firebaseAuth.userChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginPage());
    } else {
      Get.offAll(() => const HomePage());
    }
  }

  /// UI

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cPassController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();
  final FocusNode cPassFocusNode = FocusNode();

  RxBool isObscure = true.obs;
  RxBool isLoading = false.obs;

  void togglePasswordEye() {
    isObscure.value = !isObscure.value;
  }

  GlobalKey<FormState>? signUpForm = GlobalKey();

  Future<void> goSignUp() async {
    // TODO: to add validate
    // validate ? add User : show error.
    // if (signUpForm?.currentState?.validate() != true) return;
    cPassFocusNode.unfocus();
    try {
      //authenticate user
      UserCredential _cre = await firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim());
      //store user details in cfirestore

      UserAccount user = new UserAccount(
          user: _cre.user,
          userId: _cre.user?.uid,
          username: usernameController.text.trim(),
          email: emailController.text.trim(),
          password: passController.text.trim());

      print("_user => ${user.username}");
      print("_user email => ${emailController.text.trim()}");

      if (await FirestoreHelper().createNewUser(user)) {
        print("This is working");
        // user created successfully
        Get.find<UserAccountController>().user = user;
      }
      ;

      await Fluttertoast.showToast(
              msg: "Success",
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0)
          .then((value) => isLoading.value = false);
      Get.offNamedUntil(RouteNames.home, (route) => false);
    } catch (e) {
      print(e);
      isLoading.value = false;
      await Fluttertoast.showToast(
              toastLength: Toast.LENGTH_LONG,
              msg: e.toString(),
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0)
          .then((value) => isLoading.value = false);
    }
  }

  Future goLogin() async {
    passFocusNode.unfocus();
    isLoading.value = true;
    try {
      //authenticate user
      UserCredential _cre = await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim());

      Get.find<UserAccountController>().user =
          await FirestoreHelper().getUser(_cre.user!.uid);

      print(Get.find<UserAccountController>().user);

      await Fluttertoast.showToast(
              msg: "Success",
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0)
          .then((value) => isLoading.value = false);
      Get.offNamedUntil(RouteNames.home, (route) => false);
    } catch (e) {
      print(e);
      await Fluttertoast.showToast(
              toastLength: Toast.LENGTH_LONG,
              msg: e.toString(),
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0)
          .then((value) => isLoading.value = false);
      // print("Error => $e");
    }
  }

  void signOut() async {
    try {
      await firebaseAuth.signOut();
      Get.find<UserAccountController>().clear();
      Get.offAllNamed(RouteNames.login);
    } catch (e) {
      print(e);
      await Fluttertoast.showToast(
              toastLength: Toast.LENGTH_LONG,
              msg: e.toString(),
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0)
          .then((value) => isLoading.value = false);
    }
  }
}
