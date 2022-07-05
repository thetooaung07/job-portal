import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.chevron_left_rounded,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Applications",
                      style: kLogoTextStyle,
                    ),
                    SizedBox(
                      height: 35,
                      width: 35,
                    )
                  ],
                ),
              ),
              Text("Your Applications"),
              Row(
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "wait for the reply from your recruiter. Good luck!",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ApplicationCard(),
              ApplicationCard(),
              ApplicationCard(),
              ApplicationCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class ApplicationCard extends StatelessWidget {
  const ApplicationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 150,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [kCardShadow],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/logos/logo_youtube.svg",
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Facebook"),
                        Text(
                          "Nodejs Developer",
                          style: kJobPositionTextStyle,
                        ),
                        Text("Torono, Canada"),
                      ],
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.more_vert_rounded,
                size: 30,
                color: Colors.black,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: Text(
                  "Delivered",
                  style: kBodyTextStyle.copyWith(color: Colors.white),
                ),
              ),
              Text(
                "\$1200 Monthly",
                style: kCaptionTextStyle.copyWith(color: kPrimaryRedColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
