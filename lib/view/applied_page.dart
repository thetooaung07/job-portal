import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class AppliedPage extends StatelessWidget {
  const AppliedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                        onTap: () {
                          final _controller =
                              Get.find<BottomNavBarController>();
                          // _controller.selectedIndex.value = 0;
                          _controller.onPageChange(0);
                        },
                        child: Icon(
                          Icons.chevron_left_rounded,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Jobs",
                        style: kLogoTextStyle,
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                      )
                    ]),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  JobCard(
                    onTap: () {
                      Get.toNamed(RouteNames.myjobs);
                    },
                    icon: Icon(
                      Icons.check_box_outlined,
                      size: 60,
                      color: kPrimaryRedColor,
                    ),
                    text: "Applications",
                  ),
                  JobCard(
                    icon: Icon(
                      Icons.work_history_outlined,
                      size: 60,
                      color: kPrimaryRedColor,
                    ),
                    text: "History",
                  ),
                  JobCard(
                    icon: Icon(
                      Icons.bookmark_added_outlined,
                      size: 60,
                      color: kPrimaryRedColor,
                    ),
                    text: "Saved",
                  ),
                ],
              ),
            )
          ],
        ),
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
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(16, 0, 0, 0),
              blurRadius: 15,
              offset: Offset(1, 0),
              spreadRadius: 1,
            )
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        width: 160,
        height: Get.height * 0.2,
        child: Column(children: [
          icon,
          Spacer(),
          Text(
            text,
            style: kCaptionTextStyle,
          ),
        ]),
      ),
    );
  }
}
