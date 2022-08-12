import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        leading: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomIconButton(
            onTap: (() =>
                Get.find<BottomNavBarController>().selectedIndex.value = 0),
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
              onTap: () {},
              child: const Icon(
                Icons.more_vert_rounded,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        child: GridView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.03,
          ),
          children: [
            JobCard(
              onTap: () {
                Get.toNamed(RouteNames.applications);
              },
              icon: const Icon(
                Icons.check_box_outlined,
                size: 60,
                color: kPrimaryRedColor,
              ),
              text: "Applications",
            ),
            // JobCard(
            //   icon: Icon(
            //     Icons.check_box_outlined,
            //     size: 60,
            //     color: kPrimaryRedColor,
            //   ),
            //   text: "Coming Soon",
            // ),
            JobCard(
              onTap: (() => Get.toNamed(RouteNames.myJobs)),
              icon: const Icon(
                Icons.work_outline,
                size: 60,
                color: kPrimaryRedColor,
              ),
              text: "My Jobs",
            ),
            // JobCard(
            //   icon: Icon(
            //     Icons.work_history_outlined,
            //     size: 60,
            //     color: kPrimaryRedColor,
            //   ),
            //   text: "Coming Soon",
            // ),
            JobCard(
              onTap: () {
                Get.toNamed(
                  RouteNames.savePosts,
                );
              },
              icon: const Icon(
                Icons.bookmark_added_outlined,
                size: 60,
                color: kPrimaryRedColor,
              ),
              text: "Saved",
            ),
            // JobCard(
            //   icon: Icon(
            //     Icons.bookmark_added_outlined,
            //     size: 60,
            //     color: kPrimaryRedColor,
            //   ),
            //   text: "Coming Soon",
            // ),
          ],
        ),
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Flexible(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           JobCard(
        //             onTap: () {
        //               Get.toNamed(RouteNames.myjobs);
        //             },
        //             icon: Icon(
        //               Icons.check_box_outlined,
        //               size: 60,
        //               color: kPrimaryRedColor,
        //             ),
        //             text: "Applications",
        //           ),
        //           JobCard(
        //             icon: Icon(
        //               Icons.work_history_outlined,
        //               size: 60,
        //               color: kPrimaryRedColor,
        //             ),
        //             text: "History",
        //           ),
        // JobCard(
        //   icon: Icon(
        //     Icons.bookmark_added_outlined,
        //     size: 60,
        //     color: kPrimaryRedColor,
        //   ),
        //   text: "Saved",
        // ),
        //         ],
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final Widget icon;
  final String text;
  final void Function()? onTap;
  const JobCard({Key? key, required this.icon, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(16, 0, 0, 0),
              blurRadius: 15,
              offset: Offset(0, 0),
              spreadRadius: 2,
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: 160,
        height: Get.height * 0.2,
        // height: Get.height * 0.15,
        child: Column(children: [
          icon,
          const Spacer(),
          Text(
            text,
            style: kCaptionTextStyle.copyWith(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
