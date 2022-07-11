import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/auth_page_controller.dart';
import 'package:job_portal/controller/user_account_controller.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/services/database.dart';
import 'package:job_portal/widgets/job-post-card-hr.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        label: "Profile",
        action: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: CustomIconButton(
              onTap: () {},
              child: Icon(
                Icons.more_vert_rounded,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<UserAccountController>(
            builder: (userAccountController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: kPrimaryRedColor,
                          radius: 50,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              userAccountController.user.username ?? "User",
                              style: kHeaderTextStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              " Flutter Beginner",
                              style: kBulletListTextStyle.copyWith(
                                  color: Colors.black54),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text("Contact me:"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("@thetooaung07")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  //TODO:Change Custom to look more beautiful // border of inside indicator being Square
                  //  Complete Your Profile
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Complete Your Profile (1/4)"),
                        SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            backgroundColor: themeBgColor,
                            value: 0.3,
                            minHeight: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  userAccountController.user.profileDetails != true ||
                          userAccountController.user.cvFile != true
                      ? StreamBuilder<UserAccount>(
                          stream: FirestoreHelper().userAccountStream(
                              userAccountController.user.userId!),
                          builder: (context, snapshot) {
                            return Container(
                              height: 200,
                              child: ListView(
                                padding: EdgeInsets.only(left: 20),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  if (snapshot.connectionState ==
                                      ConnectionState.active) ...[
                                    snapshot.data!.profileDetails != true
                                        ? ProfileCardHr(
                                            onTap: () {
                                              userAccountController
                                                  .updateProfileStats(
                                                      "users",
                                                      firebaseAuth
                                                          .currentUser!.uid,
                                                      {
                                                    "profile_details": true
                                                  });
                                            },
                                            icon: Icon(
                                              Icons.person_outline_rounded,
                                              size: 35,
                                            ),
                                            buttonLabel: "Continue",
                                            label: "Details Info",
                                          )
                                        : ProfileCardHr(
                                            onTap: () {
                                              userAccountController
                                                  .updateProfileStats(
                                                      "users",
                                                      firebaseAuth
                                                          .currentUser!.uid,
                                                      {
                                                    "profile_details": false
                                                  });
                                            },
                                            icon: Icon(
                                              Icons.person_outline_rounded,
                                              size: 35,
                                            ),
                                            buttonLabel: "Updated",
                                            label:
                                                "Please describe personal informations",
                                          ),
                                    snapshot.data!.cvFile != true
                                        ? ProfileCardHr(
                                            onTap: () {
                                              userAccountController
                                                  .updateProfileStats(
                                                      "users",
                                                      firebaseAuth
                                                          .currentUser!.uid,
                                                      {"cv_file": true});
                                            },
                                            icon: Icon(
                                              Icons.file_upload_outlined,
                                              size: 35,
                                            ),
                                            buttonLabel: "Upload",
                                            label: "Upload your cv",
                                          )
                                        : ProfileCardHr(
                                            onTap: () {
                                              userAccountController
                                                  .updateProfileStats(
                                                      "users",
                                                      firebaseAuth
                                                          .currentUser!.uid,
                                                      {"cv_file": false});
                                            },
                                            icon: Icon(
                                              Icons.file_upload_outlined,
                                              size: 35,
                                            ),
                                            buttonLabel: "Uploaded",
                                            label: "Upload your cv",
                                          ),
                                  ]
                                ],
                              ),
                            );
                          })
                      : SizedBox(),

                  ListTile(
                    horizontalTitleGap: 7,
                    minLeadingWidth: 0,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    leading: Icon(Icons.settings),
                    title: Text("Setting"),
                    trailing: Icon(Icons.chevron_right_rounded),
                  ),

                  ListTile(
                    horizontalTitleGap: 7,
                    minLeadingWidth: 0,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    leading: Icon(
                      Icons.message_rounded,
                      size: 25,
                    ),
                    title: Text("Help & Feedback"),
                    trailing: Icon(Icons.chevron_right_rounded),
                  ),

                  Container(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("--- v 1.0.0 ---"),
                        GetBuilder<AuthController>(
                          builder: (controller) => TextButton(
                            child: Text(
                              "Sign Out",
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              controller.signOut();
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ProfileCardHr extends StatelessWidget {
  final Widget? icon;
  final String? label;
  final String? buttonLabel;
  final void Function()? onTap;

  const ProfileCardHr(
      {Key? key, this.icon, this.label, this.buttonLabel, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20, right: 20),
      width: 150,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(19, 83, 83, 83),
            blurRadius: 8,
            offset: Offset(2, -1),
            spreadRadius: 4,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
        child: GetBuilder<UserAccountController>(builder: (controller) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icon ??
                    Icon(
                      Icons.person_rounded,
                      size: 35,
                    ),
                Text(
                  label ?? "Set Your Profile Details",
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,
                ),
                CustomTextButton(
                  onTap: onTap,
                  // onTap: () => controller.updateProfileStats(
                  //   "profile_stats",
                  //   firebaseAuth.currentUser!.uid,
                  // controller.profileStats.
                  // ),
                  label: buttonLabel ?? "Complete",
                ),
              ]);
        }),
      ),
    );
  }
}
