import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/saved_jobs_page_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/routes/routes.dart';

class JobPostCardVt extends StatelessWidget {
  final bool? includeSave;
  // final bool? isDimissable;

  const JobPostCardVt({Key? key, this.includeSave = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SavedJobsPageController controller =
        Get.put(SavedJobsPageController());
    return GestureDetector(
      onTap: () => Get.toNamed(RouteNames.jobDetails),
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
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
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/logo_youtube.svg",
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 65,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Icon(Icons.favorite_outline_rounded),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    includeSave == true
                        ? Obx(
                            () => CustomIconButton(
                              onTap: () {
                                controller.addToFavourite();
                              },
                              child: controller.isFavourite.value
                                  ? Icon(
                                      Icons.favorite_rounded,
                                      color: kPrimaryRedColor,
                                    )
                                  : Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.black45,
                                    ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$1299/Mo",
                      style: kLabelTextStyle.copyWith(
                          color: kPrimaryRedColor, fontSize: 18),
                    ),
                  ],
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
