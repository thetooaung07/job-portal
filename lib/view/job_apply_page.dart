import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class JobApplyPage extends StatelessWidget {
  const JobApplyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomIconButton(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.chevron_left_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        label: "Apply Now",
        action: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: CustomIconButton(
              onTap: () {
                Get.back();
                Get.find<BottomNavBarController>().selectedIndex.value = 1;
              },
              child: Icon(
                Icons.search_rounded,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
