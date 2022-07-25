import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/auth_page_controller.dart';
import 'package:job_portal/controller/user_account_controller.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/profile_stats.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/services/database.dart';
import 'package:job_portal/widgets/job-post-card-hr.dart';
import 'package:job_portal/widgets/my_app_bar.dart';
import 'package:job_portal/widgets/profile_widgets.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          label: "Profile",
          action: [
            StyledPopupMenuBtn(),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: StreamBuilder<UserAccount>(
                          stream: FirestoreHelper()
                              .userAccountStream(firebaseAuth.currentUser!.uid),
                          builder: (context, snapshot) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Profile Pic
                                Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: AccountPageProfile(
                                        snapshot: snapshot,
                                        controller: userAccountController,
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: userAccountController
                                              .uploadProfile,
                                          child: Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              shape: BoxShape.circle,
                                              color: Color.fromARGB(
                                                  176, 12, 12, 12),
                                            ),
                                            child: Icon(
                                              Icons.edit,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                                // Profile Pic

                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      userAccountController.user.username ??
                                          "User",
                                      style: kHeaderTextStyle,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Flutter Beginner",
                                      style: kBulletListTextStyle.copyWith(
                                          color: Colors.black54),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text("Contact me:"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      userAccountController.user.email ?? "",
                                      softWrap: true,
                                      maxLines: 2,
                                    )
                                  ],
                                )
                              ],
                            );
                          }),
                    ),
                    //TODO:Change Custom to look more beautiful // border of inside indicator being Square
                    //  Complete Your Profile
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15),
                      child: StreamBuilder<UserAccount>(
                          stream: FirestoreHelper()
                              .userAccountStream(firebaseAuth.currentUser!.uid),
                          builder: (context, snapshot) {
                            Map profileStats = {};
                            if (snapshot.connectionState ==
                                ConnectionState.active) {
                              profileStats = ProfileStats(
                                      cvFile: snapshot.data!.cvFile,
                                      profileDetails:
                                          snapshot.data!.profileDetails,
                                      addABio: snapshot.data!.addABio)
                                  .toJson();
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            style:
                                                TextStyle(color: Colors.black),
                                            text: "Complete Your Profile ",
                                            children: [
                                              TextSpan(
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: kPrimaryRedColor),
                                                  text:
                                                      "( ${userAccountController.calculate(profileStats)} / ${profileStats.length} )"),
                                            ]),
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //     "Complete Your Profile (${userAccountController.calculate(profileStats)}/${profileStats.length})"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: LinearProgressIndicator(
                                      backgroundColor: themeBgColor,
                                      value: (userAccountController
                                              .calculate(profileStats) /
                                          profileStats.length),
                                      minHeight: 12,
                                    ),
                                  ),
                                ],
                              );
                            } else
                              return SizedBox();
                          }),
                    ),
// only if you want to disapper cards if both are true
                    // userAccountController.user.profileDetails != true ||
                    //         userAccountController.user.cvFile != true ||
                    //         userAccountController.user.addABio != true
                    //     ?

                    StreamBuilder<UserAccount>(
                        stream: FirestoreHelper()
                            .userAccountStream(firebaseAuth.currentUser!.uid),
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
                                                    {"profileDetails": true});
                                          },
                                          icon: Icon(
                                            Icons.person_outline_rounded,
                                            size: 35,
                                          ),
                                          buttonLabel: "See All",
                                          label: "Details Info",
                                        )
                                      : CheckedProfileCardHr(
                                          child: ProfileCardHr(
                                            onTap: () {
                                              userAccountController
                                                  .updateProfileStats(
                                                      "users",
                                                      firebaseAuth
                                                          .currentUser!.uid,
                                                      {
                                                    "profileDetails": false
                                                  });
                                            },
                                            icon: Icon(
                                              Icons.person_rounded,
                                              size: 35,
                                            ),
                                            buttonLabel: "Edit",
                                            label: "Personal Info is updated",
                                          ),
                                        ),
                                  snapshot.data!.cvFile != true
                                      ? ProfileCardHr(
                                          onTap: () {
                                            userAccountController
                                                .updateProfileStats(
                                                    "users",
                                                    firebaseAuth
                                                        .currentUser!.uid,
                                                    {"cvFile": true});
                                          },
                                          icon: Icon(
                                            Icons.file_upload_outlined,
                                            size: 35,
                                          ),
                                          buttonLabel: "Upload Now",
                                          label: "Upload your cv",
                                        )
                                      : CheckedProfileCardHr(
                                          child: ProfileCardHr(
                                            onTap: () {
                                              userAccountController
                                                  .updateProfileStats(
                                                      "users",
                                                      firebaseAuth
                                                          .currentUser!.uid,
                                                      {"cvFile": false});
                                            },
                                            icon: Icon(
                                              Icons.file_upload,
                                              size: 35,
                                            ),
                                            buttonLabel: "Edit",
                                            label: "Your CV is uploaded.",
                                          ),
                                        ),
                                  snapshot.data!.addABio != true
                                      ? ProfileCardHr(
                                          onTap: () {
                                            userAccountController
                                                .updateProfileStats(
                                                    "users",
                                                    firebaseAuth
                                                        .currentUser!.uid,
                                                    {"addABio": true});
                                          },
                                          icon: Icon(
                                            Icons.message_outlined,
                                            size: 35,
                                          ),
                                          label: "Add a bio",
                                          buttonLabel: "Add Now",
                                        )
                                      : CheckedProfileCardHr(
                                          child: ProfileCardHr(
                                            onTap: () {
                                              userAccountController
                                                  .updateProfileStats(
                                                      "users",
                                                      firebaseAuth
                                                          .currentUser!.uid,
                                                      {"addABio": false});
                                            },
                                            icon: Icon(
                                              Icons.message_rounded,
                                              size: 35,
                                            ),
                                            label: "Bio is added",
                                            buttonLabel: "Edit",
                                          ),
                                        ),
                                ]
                              ],
                            ),
                          );
                        })
                    // : SizedBox()

                    ,

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
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "version 1.0",
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        floatingActionButton: FloatingActionButton.extended(
          elevation: 5,
          highlightElevation: 8,
          icon: Icon(
            Icons.edit_note,
            color: Colors.black,
          ),
          label: Text(
            "Post a job",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          onPressed: () {
            Get.toNamed(RouteNames.postJob);
          },
        ));
  }
}

class StyledPopupMenuBtn extends StatelessWidget {
  const StyledPopupMenuBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserAccountController userAccountController =
        Get.find<UserAccountController>();

    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: PopupMenuButton<dynamic>(
        onSelected: (value) {
          if (value == 2) {
            Get.toNamed(RouteNames.eidtProfile);
          }
          if (value == 3) {}
          if (value == 4) {
            Get.find<AuthController>().signOut();
          }
        },
        padding: EdgeInsets.all(2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        splashRadius: 0,
        // color: Colors.transparent,
        elevation: 5,
        position: PopupMenuPosition.under,
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
          child: CustomIconButton(
            // onTap: () {},
            child: Icon(
              Icons.more_vert_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              minLeadingWidth: 10,
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ),
          PopupMenuItem(
            value: 2,
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: ListTile(
              // onTap: () {
              // Get.toNamed(RouteNames.eidtProfile);
              // },
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              minLeadingWidth: 10,
              leading: Icon(Icons.edit_note_rounded),
              title: Text("Edit Profile"),
            ),
          ),
          PopupMenuItem(
            value: 3,
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: ListTile(
              onTap: () {
                Get.toNamed(RouteNames.myJobs);
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              minLeadingWidth: 10,
              leading: Icon(Icons.edit_calendar_outlined),
              title: Text("Manage Jobs"),
            ),
          ),
          PopupMenuDivider(),
          PopupMenuItem(
              value: 4,
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                minLeadingWidth: 10,
                iconColor: Colors.red,
                textColor: Colors.red,
                leading: Icon(Icons.logout_outlined),
                title: Text("Sign Out"),
              )),
        ],
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

class CheckedProfileCardHr extends StatelessWidget {
  final ProfileCardHr child;

  const CheckedProfileCardHr({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 10,
          right: 20,
          child: Icon(
            Icons.check_circle_outline_rounded,
            color: Colors.green,
            size: 30,
          ),
        )
      ],
    );
  }
}
