import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class NearbyPage extends StatelessWidget {
  const NearbyPage({Key? key}) : super(key: key);

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
          label: "Search",
          action: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 20, 10),
              child: CustomIconButton(
                onTap: (() => Get.toNamed(RouteNames.search)),
                child: const Icon(
                  Icons.search_rounded,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: SvgPicture.asset(
                    "assets/icons/current_dev.svg",
                    width: 300,
                    height: 300,
                  ),
                ),
                Text(
                  "This Section is still in Development",
                  style: kHeaderTextStyle.copyWith(color: Colors.black54),
                ),
              ],
            ),
          ),
        ));
  }
}
