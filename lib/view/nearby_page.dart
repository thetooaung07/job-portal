import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';

class NearbyPage extends StatelessWidget {
  const NearbyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              child: SvgPicture.asset(
                "assets/logos/current_dev.svg",
                width: 300,
                height: 300,
              ),
            ),
            Text(
              "This Page is still in Development",
              style: kHeaderTextStyle.copyWith(color: Colors.black54),
            ),
          ],
        ),
      ),
    ));
  }
}
