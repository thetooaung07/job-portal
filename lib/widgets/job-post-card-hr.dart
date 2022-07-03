import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/routes/routes.dart';

class JobPostCardHr extends StatelessWidget {
  const JobPostCardHr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteNames.jobDetails),
      child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: Colors.teal),
            // TODO: add bg color according to design
            color: Colors.white,
            boxShadow: [kCardShadow],
          ),
          padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/logos/logo_youtube.svg",
                    height: 40,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Apple",
                          style: kLabelTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("45 Job vacancy"),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$bullet \$2K - 5K/Mo"),
                  SizedBox(
                    height: 5,
                  ),
                  Text("$bullet Remote / Onsite"),
                ],
              ),
              CustomTextButton(),
            ],
          )),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: btnBgColorGrey,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          "Show All",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
