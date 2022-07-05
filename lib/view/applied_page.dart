import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
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
                        child: Icon(
                          Icons.clear_all,
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  JobCard(
                    icon: Icon(
                      Icons.check_box_outlined,
                      size: 60,
                    ),
                    text: "Applications",
                  ),
                  JobCard(
                    icon: Icon(
                      Icons.work_history_outlined,
                      size: 60,
                    ),
                    text: "History",
                  ),
                  JobCard(
                    icon: Icon(
                      Icons.bookmark_added_outlined,
                      size: 60,
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
  const JobCard({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      width: Get.width * 0.4,
      height: Get.width * 0.4,
      child: Column(children: [
        icon,
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: kCaptionTextStyle,
        ),
      ]),
    );
  }
}
