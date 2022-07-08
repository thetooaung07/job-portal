import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/auth_page_controller.dart';
import 'package:job_portal/routes/routes.dart';

class CreateAccountPage extends GetView<CreateAccountPageController> {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CreateAccountPageController());
    return Scaffold(
      backgroundColor: themeBgMainColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "REGISTER ACCOUNT!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    " Fill your details to sign up",
                    style: kBulletListTextStyle,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Username
                          TextFormField(
                            autofocus: true,
                            controller: controller.usernameEditingController,
                            onEditingComplete:
                                controller.emailFocusNode.requestFocus,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              focusColor: Colors.black,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              hoverColor: Colors.transparent,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  )),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Icon(
                                  Icons.person_outline_rounded,
                                  size: 25,
                                ),
                              ),
                              hintText: "Username",
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          //Email

                          TextFormField(
                            autofocus: true,
                            controller: controller.emailEditingController,
                            onEditingComplete:
                                controller.passowrdFocusNode.requestFocus,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              focusColor: Colors.black,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              hoverColor: Colors.transparent,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  )),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Icon(
                                  Icons.email_outlined,
                                  size: 25,
                                ),
                              ),
                              hintText: "Email",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //Password
                          Obx(
                            () => TextFormField(
                              onEditingComplete:
                                  controller.cPassowrdFocusNode.requestFocus,
                              obscureText: controller.isObscure.value,
                              focusNode: controller.passowrdFocusNode,
                              controller: controller.passwordEditingController,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 30),
                                hoverColor: Colors.transparent,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    )),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Icon(
                                    Icons.lock_outline_rounded,
                                    size: 25,
                                  ),
                                ),
                                hintText: "Password",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          // Confirm Password
                          Obx(
                            () => TextFormField(
                              obscureText: controller.isObscure.value,
                              focusNode: controller.cPassowrdFocusNode,
                              controller: controller.cPassEditingController,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 30),
                                hoverColor: Colors.transparent,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    )),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
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

                          SizedBox(
                            height: 40,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  padding: EdgeInsets.symmetric(vertical: 25),
                                ),
                                onPressed: () {
                                  Get.toNamed(RouteNames.home);
                                },
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text("- Or Continue With -"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        color: Colors.red,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        color: Colors.red,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have account? "),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(RouteNames.home),
                        child: Text(
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
    );
  }
}
