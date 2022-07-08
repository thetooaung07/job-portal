import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  final TextEditingController usernameEditingController =
      TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  final FocusNode passowrdFocusNode = FocusNode();

  RxBool isObscure = true.obs;

  void togglePasswordEye() {
    print("Ontap");
    isObscure.value = !isObscure.value;
  }
}

class CreateAccountPageController extends GetxController {
  final TextEditingController usernameEditingController =
      TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController cPassEditingController = TextEditingController();

  final FocusNode passowrdFocusNode = FocusNode();
  final FocusNode cPassowrdFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();

  RxBool isObscure = true.obs;

  void togglePasswordEye() {
    isObscure.value = !isObscure.value;
  }
}
