import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/routes/routes.dart';

class JobPostCardVt extends StatelessWidget {
  const JobPostCardVt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteNames.jobDetails),
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
        margin: EdgeInsets.only(
            left: kSpacingUnit * 1.5,
            right: kSpacingUnit * 1.5,
            bottom: kSpacingUnit * 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
          boxShadow: [kCardShadow],
          color: Colors.white,
        ),
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/logos/logo_youtube.svg",
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nodejs Developer",
                            style: kJobPositionTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Facebook"),
                        ],
                      ),
                    ),
                  ],
                ),
                // Icon(Icons.favorite_outline_rounded),
                Text(
                  "\$1299/Mo",
                  style: kLabelTextStyle.copyWith(
                      color: kPrimaryRedColor, fontSize: 18),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 18,
                    ),
                    Text("Full Time"),
                    SizedBox(width: 15),
                    Icon(
                      Icons.workspace_premium_outlined,
                      size: 18,
                    ),
                    Text("Mid-Senior"),
                  ],
                ),
                Text("${bullet}23 min ago")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BubbleContainer extends StatelessWidget {
  final Widget child;
  const BubbleContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue[300]),
      child: child,
    );
  }
}
