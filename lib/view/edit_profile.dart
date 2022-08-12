import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/user_account_controller.dart';
import 'package:job_portal/controller/user_info_update_controller.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/services/database.dart';
import 'package:job_portal/widgets/my_app_bar.dart';
import 'package:job_portal/widgets/profile_widgets.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserInfoUpdateController controller =
        Get.put(UserInfoUpdateController());
    return Scaffold(
      appBar: MyAppBar(
        leading: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomIconButton(
            onTap: (() => Get.back()),
            child: const Icon(
              Icons.chevron_left_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        label: "Jobs",
        action: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: CustomIconButton(
              onTap: (() => {}),
              child: const Icon(
                Icons.more_vert_rounded,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child:
            GetBuilder<UserAccountController>(builder: (userAccountController) {
          return StreamBuilder<UserAccount>(
              stream: FirestoreHelper()
                  .userAccountStream(firebaseAuth.currentUser!.uid),
              builder: (context, snapshot) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      // Profile Pic
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: AccountPageProfile(
                              snapshot: snapshot,
                              controller: userAccountController,
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: userAccountController.uploadProfile,
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    shape: BoxShape.circle,
                                    color:
                                        const Color.fromARGB(176, 12, 12, 12),
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                        ],
                      ),
                      // Profile Pic

                      const SizedBox(
                        height: 10,
                      ),
                      LabelTextField(
                        label: "Username",
                        hintText: "Change Username",
                        controller: controller.usernameC,
                      ),
                      LabelTextField(
                        label: "Email",
                        hintText: "Change Email",
                        controller: controller.emailC,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          child: Container(
                              width: Get.width / 4,
                              alignment: Alignment.center,
                              child: Text(
                                "Update",
                                style: kLabelTextStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )),
                          onPressed: () {
                            controller.usernameAndEmailUpdate();
                          },
                        ),
                      )
                    ],
                  ),
                );
              });
        }),
      ),
    );
  }
}

class LabelTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;

  const LabelTextField({Key? key, this.label, this.hintText, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
          child: Text(
            label ?? "",
            style: kLabelTextStyle.copyWith(
                fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controller,
            autofocus: false,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                prefixIcon: null,
                suffixIcon: null,
                contentPadding: const EdgeInsets.all(20),
                hintText: hintText ?? "",
                hintStyle: const TextStyle(
                  color: Color.fromARGB(111, 0, 0, 0),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )

                // enabledBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10),
                //     borderSide: BorderSide(
                //       color: Colors.white,
                //       width: 1,
                //     )),

                // focusedBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10),
                //     borderSide: BorderSide(
                //       color: Colors.white,
                //       width: 1,
                //     )),
                // errorBorder: InputBorder.none,
                // disabledBorder: InputBorder.none,
                ),
          ),
        ),
      ],
    );
  }
}
