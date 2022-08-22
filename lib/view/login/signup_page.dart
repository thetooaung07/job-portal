import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/auth_page_controller.dart';
import 'package:job_portal/routes/routes.dart';

class SignUpPage extends GetView<AuthController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: themeBgMainColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "REGISTER ACCOUNT!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        " Fill your details to sign up",
                        style: kBulletListTextStyle,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 30),
                        child: Form(
                          // key: controller.signUpForm,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Username
                              TextFormField(
                                autofocus: true,
                                controller: controller.usernameController,
                                onEditingComplete:
                                    controller.emailFocusNode.requestFocus,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  focusColor: Colors.black,
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  hoverColor: Colors.transparent,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                        width: 2,
                                      )),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Icon(
                                      Icons.person_outline_rounded,
                                      size: 25,
                                    ),
                                  ),
                                  hintText: "Username",
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              //Email

                              TextFormField(
                                autofocus: true,
                                controller: controller.emailController,
                                onEditingComplete:
                                    controller.passFocusNode.requestFocus,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  focusColor: Colors.black,
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  hoverColor: Colors.transparent,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                        width: 2,
                                      )),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Icon(
                                      Icons.email_outlined,
                                      size: 25,
                                    ),
                                  ),
                                  hintText: "Email",
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              //Password
                              Obx(
                                () => TextFormField(
                                  onEditingComplete:
                                      controller.cPassFocusNode.requestFocus,
                                  obscureText: controller.isObscure.value,
                                  focusNode: controller.passFocusNode,
                                  controller: controller.passController,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    hoverColor: Colors.transparent,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        )),
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: const Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Icon(
                                        Icons.lock_outline_rounded,
                                        size: 25,
                                      ),
                                    ),
                                    hintText: "Password",
                                    hintStyle: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.black26,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              // Confirm Password
                              Obx(
                                () => TextFormField(
                                  obscureText: controller.isObscure.value,
                                  focusNode: controller.cPassFocusNode,
                                  controller: controller.cPassController,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    hoverColor: Colors.transparent,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        )),
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: const Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Icon(
                                        Icons.lock_outline_rounded,
                                        size: 25,
                                      ),
                                    ),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 30),
                                      child: GestureDetector(
                                        onTap: (() =>
                                            controller.togglePasswordEye()),
                                        child: Icon(
                                          controller.isObscure.value
                                              ? Icons.visibility_off_rounded
                                              : Icons.visibility_rounded,
                                          color: Colors.black54,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                    hintText: "Confirm Password",
                                    hintStyle: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.black26,
                                    ),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              //Forget Password
                              // TextButton(
                              //   style: TextButton.styleFrom(
                              //     // splashFactory: NoSplash.splashFactory,
                              //     primary: Color.fromARGB(166, 0, 0, 0),
                              //   ),
                              //   onPressed: () {},
                              //   child: Text("Forget Password?"),
                              // ),

                              const SizedBox(
                                height: 40,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  height: 55,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.black,
                                        // padding: EdgeInsets.symmetric(vertical: 20),
                                      ),
                                      onPressed: () {
                                        controller.goSignUp();
                                      },
                                      child: Obx(
                                        () => Center(
                                          child: controller.isLoading.isTrue
                                              ? const SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child:
                                                      CircularProgressIndicator())
                                              : const Text(
                                                  "Sign Up",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                        ),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      // const Text("- Or Continue With -"),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //       height: 60,
                      //       width: 60,
                      //       color: Colors.red,
                      //       margin: const EdgeInsets.symmetric(
                      //           horizontal: 10, vertical: 20),
                      //     ),
                      //     Container(
                      //       height: 60,
                      //       width: 60,
                      //       color: Colors.red,
                      //       margin: const EdgeInsets.symmetric(
                      //           horizontal: 10, vertical: 20),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have account? "),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.reset();
                              Get.toNamed(RouteNames.login);
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
